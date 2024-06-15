import SwiftUI

struct ShellDetails: View {
    
    var currentShell: Shellfish;
    
    var body: some View {
        
        ScrollView(.vertical) {
            
            Text(currentShell.getName())
                .font(.system(size: 25))
            
            Image(currentShell.getImage())
                .resizable()
                .frame(width: 300, height: 270, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.bottom, 20)
            
            VStack(alignment: .leading) {
                
                HStack {
                    Image(systemName: "fork.knife")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 27, height: 27)
                        .padding(10)
                    VStack(alignment: .leading) {
                        Text("Diet")
                            .font(.system(size: 17))
                        Spacer(minLength: 5)
                        Text(currentShell.getDiet())
                            .font(.system(size: 14))
                    }
                }
                .padding(.bottom)
                
                HStack {
                    Image(systemName: "atom")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 27, height: 27)
                        .padding(10)
                    VStack(alignment: .leading) {
                        Text("Scientific Name")
                            .font(.system(size: 17))
                        Spacer(minLength: 5)
                        Text(currentShell.getScientificName())
                            .font(.system(size: 14))
                    }
                }
                .padding(.bottom)
                
                HStack {
                    Image(systemName: "house.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 27, height: 27)
                        .padding(10)
                    VStack(alignment: .leading) {
                        Text("Habitat")
                            .font(.system(size: 17))
                        Spacer(minLength: 5)
                        Text(currentShell.getHabitat())
                            .font(.system(size: 14))
                            .lineLimit(nil)
                    }
                }
                .padding(.bottom)
                
                HStack {
                    Image(systemName: "ruler.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 27, height: 27)
                        .padding(10)
                    VStack(alignment: .leading) {
                        Text("Average Size")
                            .font(.system(size: 17))
                        Spacer(minLength: 5)
                        Text(String(format: "%.0f Inches", currentShell.getAverageSize()))
                            .font(.system(size: 14))
                    }
                }
                .padding(.bottom)
                
                HStack {
                    Image(systemName: "clock.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 27, height: 27)
                        .padding(10)
                    VStack(alignment: .leading) {
                        Text("Average Lifespan")
                            .font(.system(size: 17))
                        Spacer(minLength: 5)
                        Text(String(format: "%.0f Years", currentShell.getAverageLifeSpan()))
                            .font(.system(size: 14))
                    }
                }
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    ShellDetails(currentShell: Shellfish(name: "Null", scientificName: "Null", diet: "Null", habitat: "Null", averageSize: 0, averageLifeSpan: 0, image: "Null"))
}
