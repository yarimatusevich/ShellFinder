import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class ShellFinderNetwork: ObservableObject {
    
    // TODO: Implement proper error handling
    // TODO: Implement security measures
    
    private let db = Firestore.firestore() // cloud storage database
    private var shellDB = [String: Shellfish]() // all shells in database
    
    init() {
        // updates shellDB with up to date shells from the API
        Task {
            shellDB = await fetchShells()
        }
    }
    
    // Gets all shells currently in the cloud
    private func fetchShells() async -> [String: Shellfish] {
        
        var dict = [String: Shellfish]()
        
        // Attempts to retrieve all documents from collection
        do {
            let querySnapshot = try await db.collection("shells").getDocuments()
            
            for document in querySnapshot.documents {
                let shell = try document.data(as: Shellfish.self)
                
                // Maps each document id to its corresponding shell
                dict[shell.getName()] = shell
            }
            
        } catch {
            print("Error fetching shells: \(error)")
        }
        
        return dict
    }
    
    public func getShell(shell: String) -> Shellfish {
        // TODO: implement error handling??
        return shellDB[shell]!
    }
    
    // returns an array of all names of shells in database
    public func getShellNames() -> Array<String> {
        return Array(shellDB.keys)
    }
    
    public func setUser(user: User) {
        let collectionRef = db.collection("users")
        
        if let uid = user.id {
            
            let documentRef = collectionRef.document(uid)
            
            do {
                try documentRef.setData(from: user.self)
            } catch {
                print("Failed to set user: \(error.localizedDescription)")
            }
        }
    }
    
    // Gets a user information from unique id attached to each user in database
    public func getUser(userId: String) async -> User? {
        let docRef = db.collection("users").document(userId)
        
        do {
            let user = try await docRef.getDocument(as: User.self)
            return user
            
        } catch {
            print("Failed getting user: \(error.localizedDescription)")
            return nil
        }
    }
    
    public func getUserHistory(userId: String) async -> Array<HistoryEntry> {
        var output = Array<HistoryEntry>()
        let currentUser = await getUser(userId: userId)
        guard let historyRef = currentUser?.getUserHistoryRef() else { return output }
        
        do {
            let querySnapshot = try await db.collection(historyRef).getDocuments()
            
            for document in querySnapshot.documents {
                let historyEntry = try document.data(as: HistoryEntry.self)
                output.append(historyEntry)
            }
            
        } catch {
            print("Failed to retrieve user history: \(error.localizedDescription)")
        }
        
        return output
    }
    
    public func addEntryToUserHistory(userId: String, entry: HistoryEntry) async {
        let currentUser = await getUser(userId: userId)
        
        guard let historyRef = currentUser?.getUserHistoryRef() else { return }
        
        do {
            try db.collection(historyRef).addDocument(from: entry.self)
            print("Incremented number of IDs")
        } catch {
            print("Failed to add entry to user history: \(error.localizedDescription)")
        }
    }
    
    public func incrementUserIdentificationCount(userId: String) async {
        let currentUserDocRef = db.collection("users").document(userId)
        
        do {
            try await currentUserDocRef.updateData(["numberOfIdentifications": FieldValue.increment(1.0)])
            print("Incremented number of IDs")
        } catch {
            print("Failed to increment current user's number of Identifications: \(error.localizedDescription)")
        }
    }
}
