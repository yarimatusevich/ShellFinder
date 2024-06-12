import Foundation

class Shellfish {
    private let name: String
    private let scientificName: String
    private let diet: String
    private let habitat: String
    private let averageSize: Double // average size
    private let averageLifeSpan: Double // average life span
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
}
