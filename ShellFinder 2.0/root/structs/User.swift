import Foundation
import FirebaseFirestore

struct User: Codable {
    @DocumentID var id: String?
    private let name: String
    private let numberOfIdentifications: Int
    
    init(id: String? = nil, name: String) {
        self.id = id
        self.name = name
    }
}
