import SwiftUI

struct ShellDetails: View {
    
    var currentShell: Shellfish;
    
    var body: some View {
        
        VStack {
            Text(currentShell.getName())
                .font(.system(size: 25))
            
            Image(currentShell.getImage())
                .resizable()
                .frame(width: 300, height: 295, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack {
                Image(systemName: "house.fill")
                    .padding(10)
                Text(currentShell.getHabitat())
            }
            
            Spacer() // Aligns all elements in VStack to top
        }
    }
}

#Preview {
    ShellDetails(currentShell: Shellfish(name: "Null", scientificName: "Null", diet: "Null", habitat: "Null", averageSize: 0, averageLifeSpan: 0, image: "Null"))
}
