import Foundation
import SwiftUI

struct CameraView: View {
    
    @StateObject var camera = CameraModel()
    @Binding var isSidebarVisible: Bool
    @State private var dragOffset: CGFloat = 0.0
    private let sidebarWidth: CGFloat = 300.0
    @State private var isAIResult = false
    @EnvironmentObject var network: ShellFinderNetwork
    
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
                isAIResult.toggle()
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
            
            Button(action: {
                withAnimation {
                    isSidebarVisible.toggle()
                    dragOffset = 0
                }
            }) {
                Image(systemName: "line.horizontal.3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .frame(width: 30)
                    .padding()
                }
                .offset(x: -150, y: -300)
            
            SidebarView()
                .frame(width: sidebarWidth)
                .offset(x: -50)
            
                .offset(x: isSidebarVisible ? 0 : -sidebarWidth + dragOffset)
                //.animation(.default, value: isSidebarVisible)
            
                //.offset(x: isSidebarVisible ? dragOffset : -sidebarWidth + dragOffset)
                //.animation(.none, value: dragOffset)  // No animation during drag
                //.animation(.default, value: isSidebarVisible)
            
        }
        .gesture(
            DragGesture()
//                .onChanged { value in
//                                    // Calculate dragOffset to slide the sidebar in and out
//                                    if isSidebarVisible {
//                                        // If the sidebar is open, allow dragging left to close
//                                        dragOffset = value.translation.width < 0 ? value.translation.width : 0
//                                    } else {
//                                        // If the sidebar is closed, allow dragging right to open
//                                        dragOffset = max(0, min(value.translation.width, sidebarWidth))
//                                    }
//                                }
                            .onEnded { value in
                                // Decide to open or close the sidebar based on the drag distance
                                let eval = value.translation.width > self.sidebarWidth / 3
                                withAnimation {
                                    isSidebarVisible = eval
//                                    if isSidebarVisible {
//                                        // If it was open, close if dragged left more than half
//                                        if value.translation.width < -sidebarWidth / 4 {
//                                            isSidebarVisible = false
//                                        }
//                                    } else {
//                                        // If it was closed, open if dragged right more than half
//                                        if value.translation.width > sidebarWidth / 4 {
//                                            isSidebarVisible = true
//                                        }
//                                    }
                                }
                                // Reset dragOffset after ending drag
                                dragOffset = 0
                            }
        )
        .sheet(isPresented: $isAIResult) {
            ShellDetailsView(currentShell: network.getShell(shell: "Atlantic Surf Clam"))
        }
    }
}
