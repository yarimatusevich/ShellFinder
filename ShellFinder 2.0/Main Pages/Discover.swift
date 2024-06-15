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
                            
                            VStack(alignment: .leading) {
                                
                                Text(shell.getName())
                                    .font(.system(size: 16))
                                    .lineSpacing(5)
                                    .padding(.bottom, 5)
                                Text(shell.getScientificName())
                                    .font(.system(size: 15))
                                    .italic()
                                    .lineSpacing(5)
                            }
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
