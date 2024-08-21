import Foundation
import SwiftUI
import UIKit
import AVFoundation

class AIModel: ObservableObject {
    
    @Published var currentPredictionName: String?
    @Published var currentPredictionConfidence: Double?
    
    public func processImage(imageData: Data) {
        let fileContent = imageData.base64EncodedString()
        let postData = fileContent.data(using: .utf8)
        
        // Initialize Inference Server Request with API_KEY, Model, and Model Version
        var request = URLRequest(
            url: URL(string: "https://detect.roboflow.com/shellfinder-shells-2ju95/9?api_key=9c8rWlq4HvktMOyksrUb")!, timeoutInterval: Double.infinity)
        
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = postData
        
        // Execute Post Request
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // Parse Response to String
            guard let data = data else {
                print("No data returned")
                return
            }
            
            do {
                if let jsonDict = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    
                    // Extract predictions array
                    if let predictions = jsonDict["predictions"] as? [[String: Any]] {
                        
                        if predictions.isEmpty {
                            print("No predictions found.")
                            DispatchQueue.main.async {
                                self.currentPredictionName = "empty"
                            }
                            
                        } else {
                            
                            for prediction in predictions {
                                if let className = prediction["class"] as? String {
                                    print("Class Name: \(className)")
                                    DispatchQueue.main.async {
                                        self.currentPredictionName = className
                                    }
                                }
                                
                                if let confidence = prediction["confidence"] as? Double {
                                    print("Confidence: \(confidence)")
                                    DispatchQueue.main.async {
                                        self.currentPredictionConfidence = confidence
                                    }
                                }
                            }
                        }
                    }
                    
                } else {
                    print("Could not parse JSON into a dictionary")
                }
                
            } catch {
                print("Error parsing JSON: \(error.localizedDescription)")
            }
        }
        task.resume()  // Start the network request
    }
}
