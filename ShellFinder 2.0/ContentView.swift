import SwiftUI

struct ContentView: View {
    
    @State var selectedTab = 1
    
    var body: some View {
        
        ZStack {
            TabView(selection: $selectedTab) {
                
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .tabItem {
                        Image(systemName: "fossil.shell")
                        Text("My Shells")
                    }
                    .tag(0)
                
                Text("hello vro..")
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                    .tag(1)

            }
            
            Button(action: {
                        // Define button action here
                    }) {
                        Image(systemName: "camera")
                            .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 25, height: 25)
                                .foregroundColor(.white)
                                .padding(20)
                                .background(Circle().fill(Color.blue).frame(width: 70, height: 70))
                                .shadow(radius: 5)
                    }
                    .offset(y: 325)
            
        }
    }
}

#Preview {
    ContentView()
}
