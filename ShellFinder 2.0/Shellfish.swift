import Foundation

class Shellfish {
    private let name: String
    private let scientificName: String
//    private let image: String // name of image file which will be displayed
    private let diet: String
    private let habitat: String
    private let size: String // size range in inches
    private let isEndangered: Bool // conservation status
    
    init(name: String, scientificName: String, diet: String, habitat: String, size: String, isEndangered: Bool) {
        self.name = name
        self.scientificName = scientificName
        self.diet = diet
        self.habitat = habitat
        self.size = size
        self.isEndangered = isEndangered
    }
}
