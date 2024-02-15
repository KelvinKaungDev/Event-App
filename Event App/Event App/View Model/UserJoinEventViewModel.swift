//
//  UserJoinEventViewModel.swift
//  Event App
//
//  Created by Austin Xu on 2024/2/13.
//

import Foundation

class UserJoinEventViewModel: Observable{
    var result: String = ""
    
    static var shared = UserJoinEventViewModel()
    @Published var tutors = [TutorModel]()
    
    func userJoinEvent(userId: String, eventId: String){
        guard let url = URL(string: "https://events-au.vercel.app/userOrAdmin/\(userId)/joinEvent/\(eventId)") else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        let task = session.dataTask(with: request){ data, _, error in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                if let responseString = String(data: data, encoding: .utf8) {
                    DispatchQueue.main.async {
                        self.result = responseString
                    }
                }
            }
        }
        task.resume()
        
            
        
    }
    
    func updateData(parameters : [String : Any], id : String) {
        if let url = URL(string: "https://tutorplus.vercel.app/api/tutorPlus/tutors/\(id)") {
            
            let data = try! JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            var request = URLRequest(url: url)
            request.httpMethod = "PUT"
            request.httpBody = data
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")

            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: request) { _ , _ , error in
                if error == nil {
                    self.getData()
                }
            }
            task.resume()
        }
    }
    
    func getData() {
        if let url = URL(string: "https://tutorplus.vercel.app/api/tutorPlus/tutors") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, _ , error in
                if error == nil {
                    if let safeData = data {
                        self.fetchData(safeData, getData: true)
                    }
                }
            }
            
            task.resume()
        }
    }
    func fetchData (_ data: Data, getData : Bool) {
        let decode = JSONDecoder()
        do {
            let result = try decode.decode([TutorModel].self, from: data)
            DispatchQueue.main.async {
                if getData {
                    self.tutors = result
                } else {
                    print("Hello")
                }
            }
        } catch {
            print(String(describing: error))
        }
    }
}
