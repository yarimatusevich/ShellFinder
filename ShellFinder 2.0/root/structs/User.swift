import Foundation
import Firebase
import FirebaseFirestore

struct User: Codable {
    @DocumentID var id: String?
    private let numberOfIdentifications: Int
    private let userHistoryRef: String
    
    init(id: String? = nil, numberOfIdentifications: Int, userHistoryRef: String) {
        self.id = id
        self.numberOfIdentifications = numberOfIdentifications
        self.userHistoryRef = userHistoryRef
    }
    
    // Getters
    
    public func getNumberOfIdentifications() -> Int { return numberOfIdentifications }
}
