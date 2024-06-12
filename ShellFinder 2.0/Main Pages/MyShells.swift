import SwiftUI

struct MyShells: View {
    var body: some View {
        
        ZStack {
            Color.red
                .ignoresSafeArea(.all, edges: .top)
                .padding(.bottom, 5)
            
            Text("HISTORRY")
        }
    }
}
#Preview {
    MyShells()
}
