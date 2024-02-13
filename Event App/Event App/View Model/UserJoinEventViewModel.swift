//
//  UserJoinEventViewModel.swift
//  Event App
//
//  Created by Austin Xu on 2024/2/13.
//

import Foundation

class UserJoinEventViewModel: Observable{
    static var shared = UserJoinEventViewModel()
    
//    func updateData(parameters : [String : Any], id : String) {
//        if let url = URL(string: "https://tutorplus.vercel.app/api/tutorPlus/tutors/\(id)") {
//            
//            let data = try! JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
//            var request = URLRequest(url: url)
//            request.httpMethod = "PUT"
//            request.httpBody = data
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: request) { _ , _ , error in
//                if error == nil {
//                    self.getData()
//                }
//            }
//            task.resume()
//        }
//    }
//    
//    func getData() {
//        if let url = URL(string: "https://tutorplus.vercel.app/api/tutorPlus/tutors") {
//            let session = URLSession(configuration: .default)
//            let task = session.dataTask(with: url) { data, _ , error in
//                if error == nil {
//                    if let safeData = data {
//                        self.fetchData(safeData, getData: true)
//                    }
//                }
//            }
//            
//            task.resume()
//        }
//    }
}
