import SwiftUI

struct MyShells: View {
    var body: some View {
        
        TabView {
            NavigationView {
                ScrollView {
                    Text("Hello World")
                    Text("Hello World")
                    Text("Hello World")
                }
                .navigationTitle("My Shells")
                .navigationBarItems(
                    leading: NavigationLink (
                        destination: Text("Destination"),
                          label: {
                              Text("Favorites")
                          }),
                    trailing: NavigationLink (
                        destination: Text("Destination"),
                          label: {
                              Text("Navigate")
                          }))
            }
        }
    }
}
#Preview {
    MyShells()
}
