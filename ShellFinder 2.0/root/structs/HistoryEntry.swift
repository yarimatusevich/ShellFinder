import Foundation

class HistoryEntry: Identifiable, Codable {
    private let shell: Shellfish
    private let date: String
    
    init(shell: Shellfish, date: String) {
        self.shell = shell
        self.date = date
    }
    
    // Getters
    public func getShell() -> Shellfish { return shell }
    
    public func getDate() -> String { return date }
}
