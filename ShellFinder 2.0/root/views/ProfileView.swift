import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var authentication: ShellFinderAuth
    @State private var isDisplayingEditProfile = false
    @State private var isDisplayingMyShells = false
    
    var body: some View {
        
        VStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 200, height: 200)
                .offset(y: -200)
                .padding(.vertical, 10)
            
            Text(authentication.currentUserDisplayName)
                .font(.largeTitle)
                .fontWeight(.medium)
                .offset(y: -200)
            
            Text(authentication.currentUserEmail)
                .offset(y: -200)
            
            Button(action: {isDisplayingEditProfile.toggle()}, label: {
                Text("Edit profile")
            })
            
            Button(action: {
                authentication.logOut()
            }, label: {
                Text("Log out")
            })
            
            Button(action: {
                isDisplayingMyShells = true
            }, label: {
                Text("My Shells")
            })
            
            HStack {
                Image(systemName: "magnifyingglass.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                
                Text("Number of IDs")
            }
        }
        .onAppear(perform: {
            authentication.checkUserStatus()
        })
        .navigationTitle("Profile")
        .sheet(isPresented: $isDisplayingEditProfile, content: {
            ChangeProfileView()
        })
        .sheet(isPresented: $isDisplayingMyShells, content: {
            MyShellsView()
        })
    }
}

struct MyShellsView: View {
    
    @EnvironmentObject var network: ShellFinderNetwork
    @EnvironmentObject var authentication: ShellFinderAuth
    @State private var entries = [HistoryEntry]()
    
    var body: some View {
        
        NavigationView {
            
            List(entries) { entry in
                let currentShell = entry.getShell()
                
                HStack {
                    Image(currentShell.getImage())
                        .resizable()
                        .scaledToFill()
                        .frame(width: 145, height: 130, alignment: .center)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.trailing, 5)
                    
                    VStack(alignment: .leading) {
                        Text(currentShell.getName())
                            .font(.system(size: 16))
                            .lineSpacing(5)
                            .padding(.bottom, 3)
                        
                        Text(currentShell.getScientificName())
                            .font(.system(size: 15))
                            .italic()
                            .lineSpacing(5)
                        
                        Text(entry.getDate())
                            .foregroundColor(.gray)
                            .font(.system(size: 15))
                            .offset(y: 30)
                    }
                    
                }
            }
        }
        .onAppear() {
            Task {
                let uid = authentication.getCurrentUserID()
                entries = await network.getUserHistory(userId: uid)
            }
        }
        .navigationTitle("My Shells")
    }
}

struct ChangeProfileView: View {
    
    var body: some View {
        Text("Edit profile")
    }
}

#Preview {
    ProfileView()
        .environmentObject(ShellFinderAuth())
        .environmentObject(ShellFinderNetwork())
}
