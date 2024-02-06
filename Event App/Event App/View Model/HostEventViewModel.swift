//
//  FillEventDetailViewModel.swift
//  Event App
//
//  Created by Akito Daiki on 4/2/2567 BE.
//

import Foundation
import FirebaseAuth

class HostEventViewModel: ObservableObject {
    private let authentication = Auth.auth()
    
    func hostEvent(eventData: postEventData, completion: @escaping (Bool, String?) -> Void) {
        
        guard let userId = UserDefaults.standard.string(forKey: "UserID") else {
            completion(false, "User ID not found in UserDefaults")
            return
        }
        
        let baseUrl = "https://events-au.vercel.app/org/\(userId)//createEvent"
        guard let url = URL(string: baseUrl) else {
            completion(false, "Invalid URL")
            return
        }
        
        // Prepare the request body using eventData
        let parameters: [String: Any] = [
            "name": eventData.name,
            "units": eventData.units,
            "location": eventData.location,
            "startTime": eventData.startTime,
            "endTime": eventData.endTime,
            "description": eventData.description,
            "creatorId": eventData.creatorId,
            "organizerList": eventData.organizerList
        ]
        
        guard let body = try? JSONSerialization.data(withJSONObject: parameters, options: []) else {
            completion(false, "Could not serialize request body")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = body
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(false, "Error: \(error.localizedDescription)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    completion(false, "Invalid response from server")
                    return
                }
                
                if httpResponse.statusCode != 200 {
                    let serverMessage = String(data: data ?? Data(), encoding: .utf8) ?? "No error message returned from server"
                    completion(false, "Failed with statusCode: \(httpResponse.statusCode). Server message: \(serverMessage)")
                    return
                }
                
                completion(true, nil) // Successfully hosted the event
            }
        }.resume()

        
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            DispatchQueue.main.async {
//                if let error = error {
//                    completion(false, "Error: \(error.localizedDescription)")
//                    return
//                }
//                
//                guard let httpResponse = response as? HTTPURLResponse else {
//                    completion(false, "Invalid response from server")
//                    return
//                }
//                
//                if httpResponse.statusCode == 200 {
//                    completion(true, nil) // Successfully hosted the event
//                } else {
//                    completion(false, "Failed with statusCode: \(httpResponse.statusCode)")
//                }
//            }
//        }.resume()
    }
}
