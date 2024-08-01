import Foundation
import SwiftUI

struct CameraView: View {
    
    @StateObject var camera = CameraModel()
    
    var body: some View {
        
        ZStack {
            CameraPreview(camera: camera)
                .ignoresSafeArea(.all, edges: .all)
                .onAppear(perform: {
                    camera.Check()
                })
            
            Image("roundedSquare")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 290)
                .offset(y: -75)
            
            
            Button(action: {
                print("button pressed!")
            }, label: {
                
                ZStack{
                    Circle()
                        .frame(width: 75, height: 75)
                    
                    Circle()
                        .stroke(style: StrokeStyle(lineWidth: 2))
                        .frame(width: 85, height: 85)
                }
                .foregroundColor(.white)
                
            })
            .offset(y: 275)
            
        }
        
    }
}
