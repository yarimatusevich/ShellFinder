import Foundation
import SwiftUI

struct CameraView: View {
    
    @StateObject var camera = CameraModel()
    @State private var isSidebarVisible = false
    
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
                camera.capturePhoto()
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
            
            
            
            SidebarView()
                            .frame(width: 300)
                            .offset(x: isSidebarVisible ? 0 : -450)
                            .animation(.easeInOut(duration: 0.3))
            
        }
        .gesture(
                    DragGesture()
                        .onEnded { value in
                            if value.translation.width > 100 {
                                withAnimation {
                                    isSidebarVisible = true
                                }
                            } else if value.translation.width < -100 {
                                withAnimation {
                                    isSidebarVisible = false
                                }
                            }
                        }
                )
                .overlay(
                    Button(action: {
                        withAnimation {
                            isSidebarVisible.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 30)
                            .padding()
                    }
                    .offset(x: 20, y: 50),
                    alignment: .topLeading
                )
        
    }
}
