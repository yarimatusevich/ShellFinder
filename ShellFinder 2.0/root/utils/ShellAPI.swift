import Foundation
import FirebaseCore
import FirebaseFirestore

class ShellAPI {
    
    // TODO: Implement proper error handling
    // TODO: Implement security measures
    
    private static let db = Firestore.firestore() // cloud storage database
    
    public static func fetchShells() async -> [String: Shellfish] {
        
        var dict = [String: Shellfish]()
        
        // Attempts to retrieve all documents from collection
        do {
            let querySnapshot = try await db.collection("shells").getDocuments()
            
            for document in querySnapshot.documents {
                let shell = try document.data(as: Shellfish.self)
                
                print(shell)
                
                // Maps each document id to its corresponding shell
                dict[document.documentID] = shell
            }
            
        } catch {
            print("Error fetching shells: \(error)")
        }
        
        return dict
    }
}
