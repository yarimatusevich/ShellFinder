import SwiftUI
import FirebaseAuth

struct AuthView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    @State var displayingLogIn: Bool = false // whether or not showing log in view
    @State var userIsLoggedIn: Bool = false
    
    var body: some View {
        if (userIsLoggedIn) {
            ContentView()
        } else {
            authViewContent
        }
    }
    
    var authViewContent: some View {
        VStack {
            Text("Welcome to ShellFinder")
                .font(.system(size: 40))
                .offset(y: -150)
            
            HStack {
                TextField("Email", text: $email)
                    .bold()
                    .font(.system(size: 20))
                    .padding(.horizontal, 20)
            }
            .padding(.vertical, 10)
            
            HStack {
                SecureField("Password", text: $password)
                    .bold()
                    .font(.system(size: 20))
                    .padding(.horizontal, 20)
            }
            .padding(.vertical, 10)
            
            // Sign up button
            Button {
                Authentication.registerUser(email: email, password: password)
            } label: {
                Text("Sign up")
            }

            // Log in button
            Button {
                displayingLogIn = true
            } label: {
                Text("Already have an account? Log in")
            }
            // Sheet bringing up prompts for log in info
            .sheet(isPresented: $displayingLogIn, content: {
                LoginView()
            })
        }
        // On appear checks if user is already logged in
        .onAppear {
            Auth.auth().addStateDidChangeListener { auth, user in
                if (user != nil) {
                    userIsLoggedIn.toggle()
                }
            }
        }
    }
}

struct LoginView: View {
    
    @State var email : String = ""
    @State var password : String = ""
    
    var body: some View {
        VStack {
            Text("Welcome back!")
            
            HStack {
                TextField("Email", text: $email)
                    .bold()
                    .font(.system(size: 20))
                    .padding(.horizontal, 20)
            }
            .padding(.vertical, 10)
            
            HStack {
                SecureField("Password", text: $password)
                    .bold()
                    .font(.system(size: 20))
                    .padding(.horizontal, 20)
            }
            .padding(.vertical, 10)
            
            Button {
                Authentication.logIn(email: email, password: password)
            } label: {
                Text("Log in")
            }

        }
    }
}

#Preview {
    AuthView()
}
