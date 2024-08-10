import Foundation
import FirebaseFirestore

struct User: Codable {
    @DocumentID var id: String?
    private let firstName: String
    private let lastName: String
    private let numberOfIdentifications: Int
    private let userHistory: Array<HistoryEntry>
    
    init(id: String? = nil, firstName: String, lastName: String, numberOfIdentifications: Int, history: Array<HistoryEntry>) {
        self.id = id
        self.firstName = firstName
        self.lastName = lastName
        self.numberOfIdentifications = numberOfIdentifications
        self.userHistory = history
    }
    
    // Getters
    public func getFirstName() -> String { return firstName }
    
    public func getLastName() -> String { return lastName }
    
    public func getNumberOfIdentifications() -> Int { return numberOfIdentifications }
    
    public func getUserHistory() -> Array<HistoryEntry> { return userHistory }
}
