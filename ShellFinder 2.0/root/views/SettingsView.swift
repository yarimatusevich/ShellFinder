//
//  SettingsView.swift
//  ShellFinder 2.0
//
//  Created by Drew Visconti on 8/12/24.
//

import SwiftUI
import AVFoundation

struct SettingsView: View {
    
    @Binding var isSettingsSheet: Bool
    @State private var cameraAccess: Bool
//    @State private var photosAccess: Bool
//    @State private var locationAccess: Bool
    @AppStorage("isDarkMode") private var isDarkMode: Bool = UIScreen.main.traitCollection.userInterfaceStyle == .dark
    
    init(isSettingsSheet: Binding<Bool>) {
            self._isSettingsSheet = isSettingsSheet
        
            _cameraAccess = State(initialValue: UserDefaults.standard.bool(forKey: "cameraAccess"))
            //_photosAccess = State(initialValue: UserDefaults.standard.bool(forKey: "photosAccess"))
            //_locationAccess = State(initialValue: UserDefaults.standard.bool(forKey: "locationAccess"))
    }
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                Section(header: Text("Camera Settings")) {
                    Toggle("Allow Access to Camera", systemImage: "camera", isOn: $cameraAccess)
                    .onChange(of: cameraAccess) { oldValue, newValue in
                                            // Save the new value to UserDefaults
                                            UserDefaults.standard.set(newValue, forKey: "cameraAccess")
                                            print("Changed from \(oldValue) to \(newValue)")
                                            openAppSettings()
                                        }
                    .padding(.top)
                    
                    Spacer()
                    
                    Toggle("Toggle Light/Dark Mode", systemImage: "moon", isOn: $isDarkMode)
                        .onChange(of: isDarkMode) { oldValue, newValue in
                                        // Apply the new value to the app's interface style
                                        UIApplication.shared.windows.forEach { window in
                                            window.overrideUserInterfaceStyle = newValue ? .dark : .light
                                        }
                                    }
                                    .onAppear {
                                        // Set the initial appearance based on the stored preference
                                        UIApplication.shared.windows.forEach { window in
                                            window.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
                                        }
                                    }
                    
                    .padding(.top)
                    
                    Spacer()
                    
//                    Toggle("Allow Access to Photos", systemImage: "photo", isOn: $photosAccess)
//                    .onChange(of: photosAccess) { newValue, oldValue in
//                                            // Save the new value to UserDefaults
//                                            UserDefaults.standard.set(newValue, forKey: "photosAccess")
//                                        }
//                    Spacer()
//                    Toggle("Allow Access to Location", systemImage: "location", isOn: $locationAccess)
//                    .onChange(of: locationAccess) { newValue, oldValue in
//                                            // Save the new value to UserDefaults
//                                            UserDefaults.standard.set(newValue, forKey: "locationAccess")
//                                        }
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
    
    private func openAppSettings() {
            if let settingsUrl = URL(string: UIApplication.openSettingsURLString),
               UIApplication.shared.canOpenURL(settingsUrl) {
                UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
            }
        }
}

