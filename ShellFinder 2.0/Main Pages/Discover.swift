import SwiftUI

struct Discover: View {
    
    var body: some View {
        
        let shells = ShellDatabase.getShells() // Array of all shells
        
        NavigationView {
            
            List(shells) { shell in
                NavigationLink(destination: ShellDetails(currentShell: shell)) {
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
                .navigationTitle("Discover")
            }
        }
    }
}

#Preview {
    Discover()
}
