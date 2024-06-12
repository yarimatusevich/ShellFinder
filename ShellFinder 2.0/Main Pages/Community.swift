//
//  Community.swift
//  ShellFinder 2.0
//
//  Created by Drew Visconti on 6/11/24.
//
import SwiftUI
struct Community: View {
    var body: some View {
        
        TabView {
            NavigationView {
                ScrollView {
                    Text("Hello World")
                    Text("Hello World")
                    Text("Hello World")
                }
                .navigationTitle("Communtiy")
            }
        }
    }
}
#Preview {
    Community()
}
