//
//  SidebarView.swift
//  ShellFinder 2.0
//
//  Created by Drew Visconti on 8/9/24.
//

import SwiftUI
import Foundation

struct SidebarView: View {
    
    @State var isSettingsSheet = false
    @State var isProfileSheet = false
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Button(action: {
                print("1")
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
                print("2")
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
            Text("Settings")
        })
        .sheet(isPresented: $isProfileSheet, content: {
            Text("About us")
        })
    }
}
