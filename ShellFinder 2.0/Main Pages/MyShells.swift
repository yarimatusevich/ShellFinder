import SwiftUI

struct MyShells: View {
    
    @State private var buttonCount = 2
    
    var body: some View {
        
        TabView {
            NavigationView {
                
                List(0..<buttonCount, id: \.self) { _ in
                    NavigationLink(destination: Text("Hello!!")) {
                        HStack {
                            Image("channeled_whelk")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 145, height: 130, alignment: .center)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding(.trailing, 5)
                            
                            VStack(alignment: .leading) {
                                
                                Text("TEST")
                                    .font(.system(size: 16))
                                    .lineSpacing(5)
                                    .padding(.bottom, 5)
                                Text("testingg")
                                    .font(.system(size: 15))
                                    .italic()
                                    .lineSpacing(5)
                            }
                        }
                    }
                    .navigationTitle("My Shells")
                    .navigationBarItems(
                        leading: NavigationLink (
                            destination: Text("Destination"),
                            label: {
                                Text("Favorites")
                            }),
                        trailing: NavigationLink (
                            destination: Button(action: {buttonCount += 1; print(buttonCount)}, label: {
                                Text("Button")
                            }),
                            label: {
                                Text("Navigate")
                            }))
                }
            }
        }
    }
}
//#Preview {
//    MyShells()
//}
