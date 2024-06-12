import SwiftUI

struct Discover: View {
    
    var body: some View {
        
        let discoverModel = DiscoverModel()
        let shellfish = discoverModel.getShells()
        
        ZStack {
            List(shellfish) { element in
                
            }
        }
    }
}

class DiscoverModel {
    
    func getShells() -> Array<Shellfish> {
        let keys = ShellDatabase.getKeys()
        var shellfishArray = [Shellfish]()
        
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
