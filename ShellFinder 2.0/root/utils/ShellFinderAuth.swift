import Foundation
import Firebase
import FirebaseAuth

class ShellFinderAuth: ObservableObject {
    
    public static let currentUser = Auth.auth().currentUser
    @Published var userIsLoggedIn: Bool = false
    
    // TODO: integrate into firestore DB
    // TODO: create methods for updating user display name and user photo
    // TODO: Make environmental object and upon init check current log in status
    
    
    init() {
        checkUserStatus()
    }
    
    public func checkUserStatus() {
        _ = Auth.auth().addStateDidChangeListener { auth, user in
            if (user != nil) {
                self.userIsLoggedIn = true
            }
        }
    }
    
    // Registers new user into FireAuth and creates a new user object which is stored in user DB
    public static func registerUser(email: String, password: String, displayName: String) {
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            if let error = error {
                print("Error registering user: \(error.localizedDescription)")
            }
            
            if let user = authResult?.user {
                let userId = user.uid
                let numberOfIds = 0
                let historyRef = "users/\(userId)/history"
                
                let newUser = User(numberOfIdentifications: numberOfIds, userHistoryRef: historyRef)
                
                ShellFinderNetwork().setUser(user: newUser)
                
            } else {
                print ("Error passing new user information to network")
            }
        }
    }
    
    public static func logIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { AuthDataResult, error in
            if (error != nil) {
                print("Error logging in user: \(error!.localizedDescription)")
            } else {
                print("Successfully logged in: \(email)")
            }
        }
    }
    
    public static func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error logging out: \(error.localizedDescription)")
        }
    }
    
    public static func changeEmail(newEmail: String) {
        currentUser?.sendEmailVerification(beforeUpdatingEmail: newEmail)
    }
    
    public static func changePassword(newPassword: String) {
        currentUser?.updatePassword(to: newPassword)
    }
    
    public static func changeDisplayName(newDisplayName: String) {
        // TODO
    }
    
    public static func deleteUser() {
        currentUser?.delete()
    }
}
