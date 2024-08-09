//
//  SidebarView.swift
//  ShellFinder 2.0
//
//  Created by Drew Visconti on 8/9/24.
//

import SwiftUI
import Foundation

struct SidebarView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Home")
                .padding(.top, 100)
            Text("Profile")
                .padding(.top, 20)
            Text("Settings")
                .padding(.top, 20)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color.blue)
        .foregroundColor(.white)
    }
}
