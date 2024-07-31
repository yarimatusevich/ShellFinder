import SwiftUI

struct MyShellsView: View {
    
    @State private var buttonCount = 2
//    var entries = MyShellsModel.getEntries()
    
    var body: some View {
        Text("MyShells")
//        NavigationView {
//            List(entries) { entry in
//                
//                let currentShell = entry.getShell()
//                
//                HStack {
//                    Image(currentShell.getImage())
//                        .resizable()
//                        .scaledToFill()
//                        .frame(width: 145, height: 130, alignment: .center)
//                        .clipShape(RoundedRectangle(cornerRadius: 10))
//                        .padding(.trailing, 5)
//                    
//                    VStack(alignment: .leading){
//                        Text(currentShell.getName())
//                            .font(.system(size: 16))
//                            .lineSpacing(5)
//                            .padding(.bottom, 3)
//                        
//                        Text(currentShell.getScientificName())
//                            .font(.system(size: 15))
//                            .italic()
//                            .lineSpacing(5)
//                        
//                        Text(entry.getDate())
//                            .foregroundColor(.gray)
//                            .font(.system(size: 15))
//                            .offset(y: 30)
//                    }
//                    
//                }
//                .navigationTitle("My Shells")
//                .navigationBarItems(
//                    leading: NavigationLink (
//                        destination: Text("Destination"),
//                        label: {
//                            Text("Favorites")
//                        }),
//                    trailing: NavigationLink (
//                        destination: Button(action: {buttonCount += 1; print(buttonCount)}, label: {
//                            Text("Button")
//                        }),
//                        label: {
//                            Text("Navigate")
//                        }))
//            }
//        }
    }
}

//#Preview {
//    MyShellsView()
//}
