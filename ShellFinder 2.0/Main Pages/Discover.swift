import SwiftUI

struct Discover: View {
    
    var body: some View {
        ZStack {
            Color.cyan
                .ignoresSafeArea(.all, edges: .top)
                .padding(.bottom, 5)
            
            Text("DISCOVERRR")
        }
    }
}
#Preview {
    Discover()
}
