import Foundation
import FirebaseFirestore

class HistoryEntry: Identifiable, Codable {
    
    @DocumentID public var id: String?
    private let date: Date
    private let shell: Shellfish
    
    init(id: String? = nil, date: Date, shell: Shellfish) {
        self.id = id
        self.date = date
        self.shell = shell
    }
    
    // Getters
    public func getShell() -> Shellfish { return shell }
    
    public func getDate() -> String {
        // Returns date formatted as a string
        return date.formatted()
    }
}
