import Foundation
import Firebase
import FirebaseAuth

class ShellFinderAuth: ObservableObject {
    
    @Published var userIsLoggedIn: Bool = false
    @Published var currentUserEmail: String = ""
    @Published var currentUserDisplayName: String = ""
    
    // TODO: create methods for updating user display name and user photo
    
    init() {
        checkUserStatus()
    }
    
    public func checkUserStatus() {
        _ = Auth.auth().addStateDidChangeListener { auth, user in
            if (user != nil) {
                self.userIsLoggedIn = true
                self.currentUserEmail = Auth.auth().currentUser?.email ?? "No email registered"
                self.currentUserDisplayName = Auth.auth().currentUser?.displayName ?? "Guest"
            }
        }
    }
    
    public func registerUser(email: String, password: String, displayName: String) {
        
        // Registers new user into FireAuth and creates a new user object which is stored in user DB
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            
            if let error = error {
                print("Error registering user: \(error.localizedDescription)")
            }
            
            if let user = authResult?.user {
                let userId = user.uid
                let numberOfIds = 0
                let historyRef = "users/\(userId)/history"
                
                let newUser = User(id: userId, numberOfIdentifications: numberOfIds, userHistoryRef: historyRef)
                
                ShellFinderNetwork().setUser(user: newUser)
                self.setDisplayName(displayName: displayName)
                
            } else {
                print ("Error passing new user information to network")
            }
        }
    }
    
    public func logIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { AuthDataResult, error in
            if (error != nil) {
                print("Error logging in user: \(error!.localizedDescription)")
            } else {
                print("Successfully logged in: \(email)")
            }
        }
    }
    
    public func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("Error logging out: \(error.localizedDescription)")
        }
    }
    
    public func getCurrentUserID() -> String {
        if let currentUID = Auth.auth().currentUser?.uid {
            return currentUID
        } else {
            return ""
        }
    }
    
    public func setDisplayName(displayName: String) {
        let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
        
        changeRequest?.displayName = displayName
        
        changeRequest?.commitChanges { error in
            if (error != nil) {
                print("Error commiting changes to user display name: \(error!.localizedDescription)")
            }
        }
        
        // Reloads profile to make sure changes are up to date
        Auth.auth().currentUser?.reload()
    }
    
    public func setEmail(email: String) {
        Auth.auth().currentUser?.sendEmailVerification(beforeUpdatingEmail: email)
    }
    
    public func setPassword(password: String) {
        Auth.auth().currentUser?.updatePassword(to: password)
    }
    
    public func deleteUser() {
        Auth.auth().currentUser?.delete()
    }
}
