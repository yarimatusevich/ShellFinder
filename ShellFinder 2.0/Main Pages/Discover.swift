import SwiftUI

struct Discover: View {
    
    var body: some View {
        
        let discoverModel = DiscoverModel()
        let shells = discoverModel.getShells()
        
        NavigationView {
            
            List(shells) { shell in
                NavigationLink(destination: ShellDetails()) {
                    HStack {
                        Image(shell.getImage())
                            .resizable()
                            .scaledToFill()
                            .frame(width: 55, height: 50, alignment: .center)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding(10)
                        
                        Text(shell.getName())
                    }
                }
            }
            
        }
    }
}
    

class DiscoverModel {
    
    init() {
        ShellDatabase.populateMap()
    }
    
    func getShells() -> Array<Shellfish> {
        var keys = ShellDatabase.getKeys()
        
        var shellfishArray = [Shellfish]() // empty array
        
        // Sorts keys in alphabetic order
        keys.sort()
        
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
