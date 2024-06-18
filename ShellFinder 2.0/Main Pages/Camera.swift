import Foundation
import SwiftUI
import UIKit
import AVFoundation

struct Camera: View {
    
    @StateObject var camera = CameraModel()
    
    var body: some View {
        ZStack {
            CameraPreview(camera: camera)
                .ignoresSafeArea(.all, edges: .all)
                .onAppear(perform: {
                    camera.Check()
                })
            
            VStack(alignment: .center) {
                
            }
        }
        
    }
}

class CameraModel: ObservableObject {
    
    @Published var session = AVCaptureSession()
    @Published var alert = false
    @Published var output = AVCapturePhotoOutput()
    @Published var preview : AVCaptureVideoPreviewLayer!
    
    func Check() {
        
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized:
            setUp()
            return
        case .denied:
            self.alert.toggle()
            return
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { status in
                if status {
                    self.setUp()
                } else {
                    DispatchQueue.main.async {
                        self.alert = true
                    }
                }
            }
        default:
            return
        }
        
    }
    
    func setUp(){
        do {
            self.session.beginConfiguration()
            let device = AVCaptureDevice.default(for: .video)
            let input = try AVCaptureDeviceInput(device: device!)
            if self.session.canAddInput(input){
                self.session.addInput(input)
            }
            if self.session.canAddOutput(self.output){
                self.session.addOutput(self.output)
            }
            self.session.commitConfiguration()
        }
        
        catch{
            print(error.localizedDescription)
        }
        
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
        }
    }
    
}

struct CameraPreview: UIViewRepresentable {
    
    @ObservedObject var camera : CameraModel
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: UIScreen.main.bounds)
        
        DispatchQueue.main.async {
                    if let previewLayer = camera.preview {
                        previewLayer.removeFromSuperlayer()
                    }
                    camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
                    camera.preview?.frame = view.bounds
                    camera.preview?.videoGravity = .resizeAspectFill
                    view.layer.addSublayer(camera.preview!)
                }
        
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        DispatchQueue.main.async {
                    camera.preview?.frame = uiView.bounds
                }
    }
}
