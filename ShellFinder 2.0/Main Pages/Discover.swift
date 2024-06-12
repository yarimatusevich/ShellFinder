//
//  Discover.swift
//  ShellFinder 2.0
//
//  Created by Drew Visconti on 6/10/24.
//
import SwiftUI
struct Discover: View {
    var body: some View {
        
        TabView {
            NavigationView {
                ScrollView {
                    Text("Hello World")
                    Text("Hello World")
                    Text("Hello World")
                }
                .navigationTitle("Discover")
            }
        }
    }
}
#Preview {
    Discover()
}
