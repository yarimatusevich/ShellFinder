//
//  SettingsView.swift
//  ShellFinder 2.0
//
//  Created by Drew Visconti on 8/12/24.
//

import SwiftUI

struct SettingsView: View {
    
    @Binding var isSettingsSheet: Bool
    @State var cameraAccess = true
    @State var photosAccess = true
    @State var locationAccess = true
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                Section(header: Text("Camera Settings")) {
                    Toggle(isOn: $cameraAccess, label: {
                        Text("Allow Access to Camera")
                    })
                    .onChange(of: cameraAccess) { newValue in
                                            // Save the new value to UserDefaults
                                            UserDefaults.standard.set(newValue, forKey: "cameraAccess")
                                        }
                    Spacer()
                    
                    Toggle(isOn: $photosAccess, label: {
                        Text("Allow Access to Photos")
                    })
                    .onChange(of: photosAccess) { newValue in
                                            // Save the new value to UserDefaults
                                            UserDefaults.standard.set(newValue, forKey: "photosAccess")
                                        }
                    Spacer()
                    
                    Toggle(isOn: $locationAccess, label: {
                        Text("Allow Access to Location")
                    })
                    .onChange(of: locationAccess) { newValue in
                                            // Save the new value to UserDefaults
                                            UserDefaults.standard.set(newValue, forKey: "locationAccess")
                                        }
                }
                .padding()
            }
            
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                Button(action: {
                    isSettingsSheet = false
                }) {
                    Text("Close")
                        .font(.headline)
                        .foregroundColor(.blue)
                })
        }
    }
}

