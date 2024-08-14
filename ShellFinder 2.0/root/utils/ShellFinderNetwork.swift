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
                dict[document.documentID] = shell
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
        
    }
}
