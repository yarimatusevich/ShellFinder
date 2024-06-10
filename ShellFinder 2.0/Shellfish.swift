import Foundation

class Shellfish {
    private let name: String
    private let scientificName: String
    private let image: String // name of image file which will be displayed
    private let location: String
    private let size: Double
    
    // class constructor called initializer in swift for some reason (crazy bastards)
    init(name: String, scientificName: String, image: String, location: String, size: Double) {
        self.name = name
        self.scientificName = scientificName
        self.image = image
        self.location = location
        self.size = size
    }
}
