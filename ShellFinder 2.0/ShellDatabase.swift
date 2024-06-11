import Foundation

class ShellDatabase {
    
    var shellMap = [String : Shellfish]()
    
    init() {
        // Atlantic Razor Clam
        shellMap["Atlantic Razor Clam"] = Shellfish(name: "Atlantic Razor Clam", scientificName: "Ensis leei",
                                                    diet: "Microrganisms", habitat: "Intertidal and subtidal areas up to 120 feet deep",
                                                    averageSize: 7, averageLifeSpan: 6)
        // Atlantic Surf Clam
        shellMap["Atlantic Surf Clam"] = Shellfish(name: "Atlantic Surf Clam", scientificName: "Spisula solidissima",
                                                   diet: "Microrganisms", habitat: "Low intertidal and surf zones, preferring sandy beds",
                                                   averageSize: 6.5, averageLifeSpan: 11)
        
        // Bay Scallop
        shellMap["Bay Scallop"] = Shellfish(name: "Bay Scallop", scientificName: "Argopecten irradians",
                                            diet: "Microrganisms", habitat: "Shallow coastal waters, preferring sandy or muddy bottoms with sea grass",
                                            averageSize: 2.75, averageLifeSpan: 1.5)
        
        // Blue Mussel
        shellMap["Blue Mussel"] = Shellfish(name: "Blue Mussel", scientificName: "Mytilus edulis",
                                            diet: "Microrganisms", habitat: "Intertidal and subtidal areas with strong currents",
                                            averageSize: 3, averageLifeSpan: 4)
        
        // Channeled Whelk
        shellMap["Channeled Whelk"] = Shellfish(name: "Channeled Whelk", scientificName: "Busycotypus canaliculatus",
                                            diet: "Bivalve mollusks", habitat: "Shallow intertidal zones and waters up to depths of 330 feet",
                                                averageSize: 5.5, averageLifeSpan: 12.5)
        
        // Eastern Mud Snail
        shellMap["Eastern Mud Snail"] = Shellfish(name: "Eastern Mud Snail", scientificName: "Ilyanassa obsoleta",
                                                  diet: "Decaying plant and animal matter", habitat: "Intertidal and shallow subtidal zones",
                                                  averageSize: 0.6, averageLifeSpan: 1.5)
        
        // Eastern Oyster
        shellMap["Eastern Oyster"] = Shellfish(name: "Eastern Oyster", scientificName: "Crassostrea virginica",
                                               diet: "Microrganisms", habitat: "Shallow coastal and estuarine waters up to 30 feet deep",
                                               averageSize: 4.5, averageLifeSpan: 12.5)
        
        // False Angel Wing
        shellMap["False Angel Wing"] = Shellfish(name: "False Angel Wing", scientificName: "Petricolaria pholadiformis",
                                                 diet: "Microrganisms", habitat: "Intertidal and shallow subtidal zones with sandy or muddy substrates",
                                                 averageSize: 3, averageLifeSpan: 1.5)
        
        // Jingle Shell
        shellMap["Jingle Shell"] = Shellfish(name: "Jingle Shell", scientificName: "Anomia simplex",
                                             diet: "Microorganisms", habitat: "Intertidal and shallow subtidal zones with sandy or muddy substrates",
                                             averageSize: 1.4, averageLifeSpan: 2)
        
        // Knobbed Whelk
        shellMap["Knobbed Whelk"] = Shellfish(name: "Knobbed Whelk", scientificName: "Busycon carica",
                                              diet: "Bivalve mollusks and gastropods", habitat: "Intertidal zones and waters up to 66 feet in depth",
                                              averageSize: 6, averageLifeSpan: 12.5)
        
        // Moon Snail
        shellMap["Moon Snail"] = Shellfish(name: "Moon Snail", scientificName: "Naticidae",
                                           diet: "Bivalve mollusks", habitat: "Intertidal and shallow subtidal zones",
                                           averageSize: 2.4, averageLifeSpan: 4)
        
        // Northern Quahog
        shellMap["Northern Quahog"] = Shellfish(name: "Northern Quahog", scientificName: "Mercenaria mercenaria",
                                                diet: "Microrganisms", habitat: "Intertidal and shallow subtidal zones in estuaries, bays, and coastal waters",
                                                averageSize: 3.375, averageLifeSpan: 35)
        
        // Oyster Drill Snail
        shellMap["Oyster Drill Snail"] = Shellfish(name: "Oyster Drill Snail", scientificName: "Urosalpinx cinerea",
                                                   diet: "Bivalve mollusks", habitat: "Intertidal and shallow subtidal zones",
                                                   averageSize: 0.8, averageLifeSpan: 2)
        
        // Ribbed Mussel
        shellMap["Ribbed Mussel"] = Shellfish(name: "Ribbed Mussel", scientificName: "Geukensia demissa",
                                              diet: "Microorganisms and detritus", habitat: "Salt marshes, estuaries, and coastal waters",
                                              averageSize: 3, averageLifeSpan: 3)
        
        // Slipper Snail
        shellMap["Slipper Snail"] = Shellfish(name: "Slipper Snail", scientificName: "Crepidula fornicata",
                                              diet: "Microorganisms", habitat: "Rocky shores, sandy beaches, mud flats",
                                              averageSize: 1.2, averageLifeSpan: 1.5)
        
        // Soft Shell Clam
        shellMap["Soft Shell Clam"] = Shellfish(name: "Soft Shell Clam", scientificName: "Mya arenaria",
                                                diet: "Microorganisms", habitat: "Sandy or muddy bottoms in intertidal zones",
                                                averageSize: 3, averageLifeSpan: 15)
        
    }
    
    func getShellInfo(shellName: String) -> Shellfish {
        let defaultShell = Shellfish(name: "nil", scientificName: "nil", diet: "nil", habitat: "nil", averageSize: 0, averageLifeSpan: 0)
        
        // Checks if shell exists in database, else returns default
        guard let output = shellMap[shellName] else { return defaultShell }
        
        return output
    }
}
