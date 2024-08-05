import Foundation
import Foundation
import SwiftUI
import UIKit
import AVFoundation

class CameraModel: NSObject, ObservableObject, AVCapturePhotoCaptureDelegate {
    
    @Published var session = AVCaptureSession()
    @Published var alert = false
    @Published var output = AVCapturePhotoOutput()
    @Published var preview : AVCaptureVideoPreviewLayer!
    //@Published var image : UIImage?
    
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
            if self.session.canAddOutput(self.output) {
                self.session.addOutput(self.output)
            }
            self.session.commitConfiguration()
            
            //output = AVCapturePhotoOutput()
            //output.setPreparedPhotoSettingsArray([AVCapturePhotoSettings(format: [AVVideoCodecKey : AVVideoCodecType.jpeg])])
            //session.addOutput(output)
        }
        
        catch{
            print(error.localizedDescription)
        }
        
        DispatchQueue.global(qos: .background).async {
            self.session.startRunning()
        }
    }
    
    func capturePhoto() {
        let settings = AVCapturePhotoSettings()
        output.capturePhoto(with: settings, delegate: self)
        
        
    }
    
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        if let imageData = photo.fileDataRepresentation() {
            print(imageData)
            
            //let image = UIImage(data: imageData)
            //let image = UIImage(data: imageData)
            
            // Load Image and Convert to Base64
            //let imageData = image?.jpegData(compressionQuality: 1)
            let fileContent = imageData.base64EncodedString()
            let postData = fileContent.data(using: .utf8)

            // Initialize Inference Server Request with API_KEY, Model, and Model Version
            var request = URLRequest(url: URL(string: "https://detect.roboflow.com/shellfinder-shells-2ju95/9?api_key=9c8rWlq4HvktMOyksrUb")!,timeoutInterval: Double.infinity)
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = postData

            // Execute Post Request
            URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
                
                // Parse Response to String
                guard let data = data else {
                    print(String(describing: error))
                    return
                }
                
                // Convert Response String to Dictionary
                do {
                    let dict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                } catch {
                    print(error.localizedDescription)
                }
                
                // Print String Response
                print(String(data: data, encoding: .utf8)!)
                print("did it!")
            }).resume()
        }
    }
    
    func AImodel() {
        
        
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
