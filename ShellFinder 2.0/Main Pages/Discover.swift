import SwiftUI

struct Discover: View {
    
    var body: some View {
        
        ZStack {
            Color.cyan
                .ignoresSafeArea(.all, edges: .top)
                .padding(.bottom, 5)
            
            HStack {
                List {
                    Text("Item 1")
                    Text("item 2")
                }
            }
        }
    }
}
#Preview {
    Discover()
}
