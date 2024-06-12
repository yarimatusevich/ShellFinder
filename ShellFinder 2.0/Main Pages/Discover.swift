import SwiftUI

struct Discover: View {
    
    var body: some View {
        
        let discoverModel = DiscoverModel()
        let shellfish = discoverModel.getShells()
        
        ZStack {
            List(shellfish) { element in
                Text(element.name)
            }
//        TabView {
//            NavigationView {
//                ScrollView {
//                    Text("Hello World")
//                    Text("Hello World")
//                    Text("Hello World")
//                }
//                .navigationTitle("Discover")
//            }
        }
    }
}
    

class DiscoverModel {
    
    init() {
        ShellDatabase.populateMap()
    }
    
    func getShells() -> Array<Shellfish> {
        let keys = ShellDatabase.getKeys()
        var shellfishArray = [Shellfish]() // empty array
        
        // goes through all keys adding each species of shellfish in database to array
        for key in keys {
            shellfishArray.append(
                ShellDatabase.getShellInfo(shellName: key)
            )
        }
        
        return shellfishArray
    }
}

#Preview {
    Discover()
}
