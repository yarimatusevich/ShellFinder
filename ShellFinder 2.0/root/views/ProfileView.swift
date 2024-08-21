import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var authentication: ShellFinderAuth
    @EnvironmentObject var network: ShellFinderNetwork
    @State private var isDisplayingEditProfile = false
    @State private var isDisplayingMyShells = false
    @State var userIDCount: Int = 0
    
    var body: some View {
        
        NavigationStack {
            Group {
                VStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding(.vertical, 10)
                        .foregroundStyle(Color(.blue))
                    
                    Text(authentication.currentUserDisplayName)
                        .font(.title)
                        .fontWeight(.medium)
                    
                    Text(authentication.currentUserEmail)
                        .font(.subheadline)
                    
                    Button(
                        action: {
                            isDisplayingMyShells.toggle()
                        }, label: {
                            HStack {
                                Image(systemName: "fossil.shell.fill")
                                
                                Text("My Shells")
                                    .font(.system(size: 18))
                                    .foregroundStyle(Color(.white))
                                    .padding(.horizontal, 10)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                        }
                    )
                    .buttonStyle(BorderedProminentButtonStyle())
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                    .padding(.horizontal, 40)
                    .padding(.vertical, 20)
                }
            }
            
            Spacer()
            
            List {
                Section(header: Text("My Statistics")) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundStyle(Color(.blue))
                            .padding(.horizontal, 20)
                        
                        Text("Shell Identifications: \(userIDCount)")
                            .font(.system(size: 18))
                            .foregroundStyle(Color(.blue))
                    }
                }
                
                Section(header: Text("Edit Profile")) {
                    Button(
                        action: {
                            print("Change password")
                        },
                        label: {
                        Text("Change password")
                    })
                    
                    Button(
                        action: {
                            print("Change email")
                        },
                        label: {
                        Text("Change email")
                    })
                    
                    Button(
                        action: {
                            print("Change display name")
                        },
                        label: {
                        Text("Change display name")
                    })
                }
                
                Button(action: {
                    authentication.logOut()
                }, label: {
                    Text("Log out")
                        .foregroundStyle(Color(.red))
                })
            }
        }
        .onAppear {
            authentication.checkUserStatus()
            Task {
                userIDCount = await network.getUserIdentificationCount(userId: authentication.getCurrentUserID())
            }
        }
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
