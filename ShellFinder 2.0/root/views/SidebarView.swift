import SwiftUI
import Foundation

struct SidebarView: View {
    
    @State var isSettingsSheet = false
    @State var isProfileSheet = false
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Button(action: {
                isSettingsSheet.toggle()
            }, label: {
                HStack {
                    Image(systemName: "gearshape.fill")
                        .padding(.trailing)
                    Text("Settings")
                }
            })
            .padding(.top, 100)
            
            Button(action: {
                isProfileSheet.toggle()
            }, label: {
                HStack {
                    Image(systemName: "questionmark.circle")
                        .padding(.trailing)
                    Text("About Us")
                }
            })
            .padding(.top, 20)
            
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.white)
        .foregroundColor(.black)
        .font(.system(size: 20))
        .sheet(isPresented: $isSettingsSheet, content: {
            SettingsView(isSettingsSheet: $isSettingsSheet)
        })
        
        .sheet(isPresented: $isProfileSheet, content: {
            Text("About us")
        })
    }
}
