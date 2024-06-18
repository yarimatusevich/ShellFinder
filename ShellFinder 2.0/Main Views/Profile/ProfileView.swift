//
//  ProfilePage.swift
//  ShellFinder 2.0
//
//  Created by Drew Visconti on 6/10/24.
//
import SwiftUI

struct ProfileView: View {
    var body: some View {
        
        TabView {
            NavigationView {
                ScrollView {
                    Text("Hello World")
                    Text("Hello World")
                    Text("Hello World")
                }
                .navigationTitle("Profile")
                .navigationBarItems(
//                    leading: NavigationLink (
//                        destination: Text("Destination"),
//                          label: {
//                              Text("Favorites")
//                          }),
                    trailing: NavigationLink (
                        destination: Text("Destination"),
                          label: {
                              Image(systemName: "gearshape.fill")
                          }))
            }
        }
        
    }
}
#Preview {
    ProfileView()
}
