import SwiftUI

struct DiscoverView: View {
    
    @State private var shells = [Shellfish]()
    
    // TODO: Write function for scrolling up reloading view with loading wheel
    
    var body: some View {
        
        NavigationStack {
            List(shells, id: \.id ) { shell in
                
                NavigationLink(destination: ShellDetailsView(currentShell: shell)) {
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
            .task {
                do {
                    shells = try await DiscoverModel.getShells()
                } catch {
                    print("Could not get shells from discover model")
                }
            }
        }
    }
}

class DiscoverModel {
    
    public static func getShells() async throws -> Array<Shellfish> {
        let decodedShellData = await ShellAPI.fetchShells()
        var keys = Array(decodedShellData.keys)
        var shellArr = [Shellfish]()
        
        // sorts keys alphabetically
        keys.sort()
        
        for key in keys {
            if let current = decodedShellData[key] {
                shellArr.append(current)
            }
        }
        
        return shellArr
    }
}

#Preview {
    DiscoverView()
}
