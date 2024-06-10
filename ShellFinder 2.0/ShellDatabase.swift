import Foundation

class ShellDatabase {
    
    var shellMap = [String : Shellfish]()
    // Dictionary mapping string (name of shellfish) to shellfish object
    // This is how we will get shell information.
    // AI spits out a name, we put the name into the dictionary and get shellfish information which is displayed
    
    init() {
        // Here I will put every single shell with have into the map
        // Then we can access it as required later
        // Just need to compile all shellfish and basic info about them
    }
    
    // function for getting info about shell from name
    // **** not working yet
//    func getShell(shellName: String) -> Shellfish {
//        
//    }
}
