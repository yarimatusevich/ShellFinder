import SwiftUI
import UIKit

struct ContentView: View {
    @State var selectedTab = 1
    @State private var isShowingImagePicker = false
    
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
                
            TabView(selection: $selectedTab) {
                
                Group {
                    ProfileView()
                        .tabItem {
                            Image(systemName: "person.fill")
                            Text("Profile")
                        }
                        .tag(0)
                    
                    CameraView()
                        .tabItem {
                            Image(systemName: "camera.fill")
                            Text("Identify")
                        }
                        .tag(1)
                    
                    DiscoverView()
                        .tabItem {
                            Image(systemName: "book.fill")
                            Text("Discover")
                        }
                        .tag(2)
                    
//                    MyShellsView()
//                        .tabItem {
//                            Image(systemName: "fossil.shell")
//                            Text("My Shells")
//                        }
//                        .tag(0)
                    
//                    CommunityView()
//                        .tabItem {
//                            Image(systemName: "person.3.fill")
//                            Text("Community")
//                        }
//                        .tag(1)
                }
                //.toolbarBackground(.white, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
            }
        }
    }
}

#Preview {
    ContentView()
}
