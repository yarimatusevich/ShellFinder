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
                                .frame(width: 145, height: 130, alignment: .center)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.trailing, 5)
                            
                            Text(shell.getName())
                                .font(.system(size: 19))
                                .lineSpacing(5)
                            
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
