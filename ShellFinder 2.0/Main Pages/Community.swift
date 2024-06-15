import SwiftUI

struct Community: View {
    var body: some View {
        
        TabView {
            NavigationView {
                ScrollView {
                    VStack {
                        Text("Hello World")
                        Text("Hello World")
                        Text("Hello World")
                    }
                }
                .navigationTitle("Communtiy")
            }
        }
    }
}
#Preview {
    Community()
}
