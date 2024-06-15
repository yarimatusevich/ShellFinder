import SwiftUI

struct ShellDetails: View {
    
    var currentShell: Shellfish;
    
    var body: some View {
        
        ScrollView(.vertical) {
            Text(currentShell.getName())
                .font(.system(size: 25))
            
            Image(currentShell.getImage())
                .resizable()
                .frame(width: 300, height: 295, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "fork.knife")
                            .padding(10)
                        Text(currentShell.getDiet())
                    }
                    
                    HStack {
                        Image(systemName: "atom")
                            .padding(10)
                        Text(currentShell.getScientificName())
                    }
                    
                    HStack {
                        Image(systemName: "house.fill")
                            .padding(10)
                        Text(currentShell.getHabitat())
                    }
                    
                    HStack {
                        Image(systemName: "house.fill")
                            .padding(10)
                        Text(String(format: "%.2f", currentShell.getAverageSize()))
                    }
                    
                    HStack {
                        Image(systemName: "house.fill")
                            .padding(10)
                        Text(String(format: "%.2f", currentShell.getAverageLifeSpan()))
                    }
                    
                    Spacer()
                }
                .padding()
            }
            
            Spacer() // Aligns all elements in VStack to top
        }
    }
}

#Preview {
    ShellDetails(currentShell: Shellfish(name: "Null", scientificName: "Null", diet: "Null", habitat: "Null", averageSize: 0, averageLifeSpan: 0, image: "Null"))
}
