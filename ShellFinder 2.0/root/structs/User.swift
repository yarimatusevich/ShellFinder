import Foundation
import FirebaseFirestore

struct User: Codable {
    @DocumentID var id: String?
    private let name: String
    private let numberOfIdentifications: Int
    
    init(id: String? = nil, name: String, numberOfIdentifications: Int) {
        self.id = id
        self.name = name
        self.numberOfIdentifications = numberOfIdentifications
    }
}
