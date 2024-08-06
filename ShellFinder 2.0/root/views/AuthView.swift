import SwiftUI

struct AuthView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack{
            Text("Welcome")
                .font(.system(size: 40))
                .offset(y: -200)
            
            HStack{
                Spacer()
                TextField("Email", text: $email)
                    .bold()
                    .font(.system(size: 20))
                Spacer()
            }
            
            HStack {
                Spacer()
                SecureField("Password", text: $password)
                    .bold()
                    .font(.system(size: 20))
                Spacer()
            }
        }
    }
}

#Preview {
    AuthView()
}
