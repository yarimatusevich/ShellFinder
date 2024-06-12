import SwiftUI

struct Community: View {
    var body: some View {
        
        ZStack {
            Color.blue
                .ignoresSafeArea(.all, edges: .top)
                .padding(.bottom, 5)
            
            Text("Communtiy tab!!!!!!!")
        }
        
    }
}
#Preview {
    Community()
}
