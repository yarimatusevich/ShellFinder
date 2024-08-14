import SwiftUI
import FirebaseCore

@main

struct ShellFinder_2_0App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var network = ShellFinderNetwork() // object handling data from app API
    @StateObject var authentication = ShellFinderAuth() // object handling user authentication
    
    var body: some Scene {
        WindowGroup {
            AuthView()
                .environmentObject(network)
                .environmentObject(authentication)
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
