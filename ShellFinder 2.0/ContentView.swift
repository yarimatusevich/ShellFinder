import SwiftUI
import UIKit

struct ContentView: View {
    @State var selectedTab = 1
    @State private var isShowingImagePicker = false
    
    
    var body: some View {
        
        ZStack {
            TabView(selection: $selectedTab) {
                MyShells()
                    .tabItem {
                        Image(systemName: "fossil.shell")
                        Text("My Shells")
                    }
                    .tag(0)
                    .navigationTitle("My Shells")
                
                Community()
                    .tabItem {
                        Image(systemName: "person.3.fill")
                        Text("Community")
                    }
                    .tag(1)
                    .navigationTitle("Community")
                
                Camera()
                    .tabItem {
                        Image(systemName: "camera.fill")
                        Text("Identify")
                    }
                    .tag(2)
                
                Discover()
                    .tabItem {
                        Image(systemName: "book.fill")
                        Text("Discover")
                    }
                    .tag(3)
                    .navigationTitle("Discover")
                
                ProfilePage()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                    .tag(4)
                    .navigationTitle("Profile")
            }
        }
    }
}

#Preview {
    ContentView()
}
