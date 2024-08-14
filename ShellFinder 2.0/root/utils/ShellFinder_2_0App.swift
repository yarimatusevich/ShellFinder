import SwiftUI
import FirebaseCore

@main

struct ShellFinder_2_0App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var network = ShellFinderNetwork() // object which handles data from app API
    
    var body: some Scene {
        WindowGroup {
            AuthView()
                .environmentObject(network)
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      FirebaseApp.configure()
      return true
    }
}
