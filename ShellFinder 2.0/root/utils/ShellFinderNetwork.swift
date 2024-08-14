import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class ShellFinderNetwork: ObservableObject{
    
    // TODO: Implement proper error handling
    // TODO: Implement security measures
    
    
    private let db = Firestore.firestore() // cloud storage database
    public var shellDB = [String: Shellfish]() // all shells in database
    
    init() {
        // updates shellDB with up to date shells from the API
        Task {
            shellDB = await fetchShells()
        }
    }
    
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
    
    public func setUser(user: User) {
        
    }
}
