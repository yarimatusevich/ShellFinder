import Foundation

class ShellDatabase {
    
    var shellMap = [String : Shellfish]()
    // Dictionary mapping string (name of shellfish) to shellfish object
    // This is how we will get shell information.
    // AI spits out a name, we put the name into the dictionary and get shellfish information which is displayed
    
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
        shellMap["Bay Scallop"] = Shellfish(name: <#T##String#>, scientificName: <#T##String#>,
                                            diet: <#T##String#>, habitat: <#T##String#>,
                                            averageSize: <#T##Double#>, averageLifeSpan: <#T##Double#>)
        
        // Blue Mussel
        shellMap["Blue Mussel"] = Shellfish(name: <#T##String#>, scientificName: <#T##String#>,
                                            diet: <#T##String#>, habitat: <#T##String#>,
                                            averageSize: <#T##Double#>, averageLifeSpan: <#T##Double#>)
        
        // Channeled Whelk
        shellMap["Channeled Whelk"] = Shellfish(name: <#T##String#>, scientificName: <#T##String#>,
                                            diet: <#T##String#>, habitat: <#T##String#>,
                                            averageSize: <#T##Double#>, averageLifeSpan: <#T##Double#>)
        
        // Eastern Mud Snail
        shellMap["Eastern Mud Snail"] = Shellfish(name: <#T##String#>, scientificName: <#T##String#>,
                                                  diet: <#T##String#>, habitat: <#T##String#>,
                                                  averageSize: <#T##Double#>, averageLifeSpan: <#T##Double#>)
        
        // Eastern Oyster
        shellMap["Eastern Oyster"] = Shellfish(name: <#T##String#>, scientificName: <#T##String#>,
                                               diet: <#T##String#>, habitat: <#T##String#>,
                                               averageSize: <#T##Double#>, averageLifeSpan: <#T##Double#>)
        
        // False Angel Wing
        shellMap["False Angel Wing"] = Shellfish(name: <#T##String#>, scientificName: <#T##String#>,
                                                 diet: <#T##String#>, habitat: <#T##String#>,
                                                 averageSize: <#T##Double#>, averageLifeSpan: <#T##Double#>)
        
        // Jingle Shell
        shellMap["Jingle Shell"] = Shellfish(name: <#T##String#>, scientificName: <#T##String#>,
                                             diet: <#T##String#>, habitat: <#T##String#>,
                                             averageSize: <#T##Double#>, averageLifeSpan: <#T##Double#>)
        
        // Knobbed Whelk
        shellMap["Knobbed Whelk"] = Shellfish(name: <#T##String#>, scientificName: <#T##String#>,
                                              diet: <#T##String#>, habitat: <#T##String#>,
                                              averageSize: <#T##Double#>, averageLifeSpan: <#T##Double#>)
        
        // Moon Snail
        shellMap["Moon Snail"] = Shellfish(name: <#T##String#>, scientificName: <#T##String#>,
                                           diet: <#T##String#>, habitat: <#T##String#>,
                                           averageSize: <#T##Double#>, averageLifeSpan: <#T##Double#>)
        
        // Northern Quahog
        shellMap["Northern Quahog"] = Shellfish(name: <#T##String#>, scientificName: <#T##String#>,
                                                diet: <#T##String#>, habitat: <#T##String#>,
                                                averageSize: <#T##Double#>, averageLifeSpan: <#T##Double#>)
        
        // Oyster Drill Snail
        shellMap["Oyster Drill Snail"] = Shellfish(name: <#T##String#>, scientificName: <#T##String#>,
                                                   diet: <#T##String#>, habitat: <#T##String#>,
                                                   averageSize: <#T##Double#>, averageLifeSpan: <#T##Double#>)
        
        // Ribbed Mussel
        shellMap["Ribbed Mussel"] = Shellfish(name: <#T##String#>, scientificName: <#T##String#>,
                                              diet: <#T##String#>, habitat: <#T##String#>,
                                              averageSize: <#T##Double#>, averageLifeSpan: <#T##Double#>)
        
        // Slipper Snail
        shellMap["Slipper Snail"] = Shellfish(name: <#T##String#>, scientificName: <#T##String#>,
                                              diet: <#T##String#>, habitat: <#T##String#>,
                                              averageSize: <#T##Double#>, averageLifeSpan: <#T##Double#>)
        
        // Soft Shell Clam
        shellMap["Soft Shell Clam"] = Shellfish(name: <#T##String#>, scientificName: <#T##String#>,
                                                diet: <#T##String#>, habitat: <#T##String#>,
                                                averageSize: <#T##Double#>, averageLifeSpan: <#T##Double#>)
        
    }
    
    // function for getting info about shell from name
    // **** not working yet
//    func getShell(shellName: String) -> Shellfish {
//        
//    }
}
