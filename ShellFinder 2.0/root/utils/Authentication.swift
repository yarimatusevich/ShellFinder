import Foundation
import Firebase
import FirebaseAuth

class Authentication {
    
    private static let user = Auth.auth().currentUser
    
    // TODO: integrate into firestore DB
    // TODO: create metods for updating user display name and user photo
    
    // Checks if user is logged in
    public static func checkAuthStatus() {
        Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user {
                let uid = user.uid
                let email = user.email
            }
        }
    }
    
    public static func registerUser(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if (error != nil) {
                print("Error registering user: \(error!.localizedDescription)")
            } else {
                print("Successfully registered: \(email)")
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
        user?.sendEmailVerification(beforeUpdatingEmail: newEmail)
    }
    
    public static func changePassword() {
        // TODO
    }
    
    public static func deleteUser() {
        user?.delete()
    }
}
