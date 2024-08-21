import Foundation
import FirebaseCore
import FirebaseFirestore

struct Shellfish: Identifiable, Codable, CustomStringConvertible {
    
    @DocumentID var id: String?
    private let name: String
    private let scientificName: String
    private let diet: String
    private let habitat: String
    private let averageSize: Double
    private let averageLifeSpan: Double
    private let image: String
    
    init(name: String, scientificName: String, diet: String, habitat: String, averageSize: Double, averageLifeSpan: Double, image: String) {
        self.name = name
        self.scientificName = scientificName
        self.diet = diet
        self.habitat = habitat
        self.averageSize = averageSize
        self.averageLifeSpan = averageLifeSpan
        self.image = image
    }
    
    // Getters
    public func getName() -> String { return name }
    
    public func getScientificName() -> String { return scientificName }
    
    public func getDiet() -> String { return diet }
    
    public func getHabitat() -> String { return habitat }
    
    public func getAverageSize() -> Double { return averageSize }
    
    public func getAverageLifeSpan() -> Double { return averageLifeSpan }
    
    public func getImage() -> String { return image }
    
    // TODO: Remove
    var description: String {
        return "\(name)"
    }
}
