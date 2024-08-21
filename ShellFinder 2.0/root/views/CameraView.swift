import Foundation
import SwiftUI

struct CameraView: View {
    
    @StateObject var camera = CameraModel()
    
    @Binding var isSidebarVisible: Bool
    @State private var dragOffset: CGFloat = 0.0
    private let sidebarWidth: CGFloat = 300.0
    
    @StateObject private var predictionModel = AIModel()
    @State private var isAIResult = false
    @EnvironmentObject var network: ShellFinderNetwork
    @EnvironmentObject var authentication: ShellFinderAuth
    
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
                Task {
                    camera.capturePhoto()
                    await waitForImageData()
                    camera.stopSession()
                    isAIResult.toggle()
                    
                    if let imageData = camera.imageData {
                        predictionModel.processImage(imageData: imageData)
                    }
                }
                
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
        }
        .gesture(
            DragGesture()
            .onEnded { value in
                let eval = value.translation.width > self.sidebarWidth / 3 //determines drag distance neeeded for sidebar to appear
                withAnimation {
                    isSidebarVisible = eval
                }
                // Reset dragOffset after ending drag
                dragOffset = 0
            }
        )
        .sheet(isPresented: $isAIResult, onDismiss: {
            resetPrediction()
            camera.startSession()
        }) {
            VStack {
                if predictionModel.currentPredictionName == nil {
                    VStack {
                        ProgressView() // This is a spinner
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(2)
                            .padding()
                        Text("Processing...")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
                else if predictionModel.currentPredictionName == "empty" {
                    Text("No predictions found.")
                    
                } else {
                    if let currentPrediction = predictionModel.currentPredictionName {
                        ShellDetailsView(
                            currentShell: network.getShell(shell: currentPrediction)
                        )
                        .onAppear {
                            if let currentPrediction = predictionModel.currentPredictionName {
                                print("REACHED")
                                let shellFromPrediction = network.getShell(shell: currentPrediction)
                                let date = Date()
                                let entry = HistoryEntry(date: date, shell: shellFromPrediction)
                                
                                Task {
                                    let uid = authentication.getCurrentUserID()
                                    await network.addEntryToUserHistory(userId: uid, entry: entry)
                                    await network.incrementUserIdentificationCount(userId: uid)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func waitForImageData() async {
            while camera.imageData == nil {
                await Task.yield()
            }
        }
    
    private func resetPrediction() {
        predictionModel.currentPredictionName = nil
        camera.imageData = nil
    }
}

