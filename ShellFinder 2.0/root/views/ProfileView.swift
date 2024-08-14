import SwiftUI

struct ProfileView: View {
    
    @State var isEditingProfile = false
    
    var body: some View {
        
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 200, height: 200)
                .offset(y: -200)
                .padding(.vertical, 10)
            
            Text("Shell F.")
                .font(.largeTitle)
                .fontWeight(.medium)
                .offset(y: -200)
            
            Text("shellfinder.user@gmail.com")
                .offset(y: -200)
            
            
            Button(action: {isEditingProfile.toggle()}, label: {
                Text("Edit profile")
            })
            
            Button(action: {
                ShellFinderAuth.logOut()
            }, label: {
                Text("Log out")
            })
            
            HStack {
                Image(systemName: "magnifyingglass.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                
                Text("Number of IDs")
            }
        }
        .navigationTitle("Profile")
        .sheet(isPresented: $isEditingProfile, content: {
            ChangeProfileView()
        })
    }
}

struct ChangeProfileView: View {
    
    var body: some View {
        Text("Edit profile")
    }
}

#Preview {
    ProfileView()
}
