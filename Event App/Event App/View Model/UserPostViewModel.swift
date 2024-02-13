//
//  UserPostViewModel.swift
//  Event App
//
//  Created by Akito Daiki on 23/1/2567 BE.
//

import Foundation
import FirebaseAuth

class UserPostViewModel: ObservableObject {
    let authentication = Auth.auth()
    
    func createUser(firstName: String, lastName: String, gender: String, age: String, phoneNumber: String, selectedUnitId: String, completion: @escaping (Bool) -> Void) {
        // API endpoint
        let baseUrl = "https://events-au.vercel.app/user/create"
        guard let url = URL(string: baseUrl) else {
            return
        }
        let ageInt = Int(age) ?? 0
        let phoneNumberInt = Int(phoneNumber) ?? 0

        // Prepare the request body
        let parameters: [String: Any] = [
            "id": authentication.currentUser?.uid ?? "nil",
            "username": authentication.currentUser?.displayName ?? "",
            "firstName": firstName,
            "lastName": lastName,
            "units": selectedUnitId,
            "gender": gender,
            "age": ageInt,
            "phoneNumber": phoneNumberInt,
            "email": authentication.currentUser?.email ?? ""
        ]

        guard let body = try? JSONSerialization.data(withJSONObject: parameters) else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = body

        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    completion(false)
                    return
                }
                
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    completion(true)
                    print(httpResponse.headers)
                } else {
                    completion(false)
                }
            }
        }.resume()
    }
}



// Local Storage

//func saveUserCredentials(userId: String, email: String) {
//    var accounts = UserDefaults.standard.dictionary(forKey: "userAccounts") as? [String: String] ?? [String: String]()
//    accounts[email] = userId
//    UserDefaults.standard.set(accounts, forKey: "userAccounts")
//}

//                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data {
//                    do {
//                        if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
//                           let message = jsonResponse["message"] as? [String: Any],
//                           let userId = message["_id"] as? String {
//                            let email = self.authentication.currentUser?.email ?? ""
//                            self.saveUserCredentials(userId: userId, email: email)
//                            completion(true)
//                        } else {
//                            completion(false)
//                        }
//                    } catch {
//                        completion(false)
//                    }
//                } else {
//                    completion(false)
//                }


// my first code
//                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data {
//                    do {
//                        // Assuming the JSON structure contains the userID in a field named "userId"
//                        if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any], let userId = jsonResponse["_id"] as? String {
//                            completion(true, userId)
//                            print("Success code : \(httpResponse.statusCode)")
//                        } else {
//                            completion(false, nil)
//                            print("Fail code : \(httpResponse.statusCode)")
//                        }
//                    } catch {
//                        print("Error parsing response data: \(error)")
//                        completion(false, nil)
//                    }
//                } else {
//                    completion(false, nil)
//                }


// my second code
//                if let httpResponse = response as? HTTPURLResponse {
//                    print("Status code: \(httpResponse.statusCode)")
//                    completion(httpResponse.statusCode == 200) // Assuming 200 is success
//                }

//                if let httpResponse = response as? HTTPURLResponse {
//                    print("Status code: \(httpResponse.statusCode)")
//                    if httpResponse.statusCode == 200, let data = data {
//                        do {
//                            // Parse the JSON data
//                            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                                print("User data: \(json)")
//                                completion(true)
//                            } else {
//                                print("Failed to parse JSON")
//                                completion(false)
//                            }
//                        } catch {
//                            print("Error parsing response data: \(error)")
//                            completion(false)
//                        }
//                    } else {
//                        completion(false)
//                    }
//                }

// my third code
//                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data {
//                    do {
//                        if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
//                           let message = jsonResponse["message"] as? [String: Any],
//                           let userId = message["_id"] as? String {
//                            // Store _id in UserDefaults
//                            UserDefaults.standard.set(userId, forKey: "userID")
//                            print("User ID (_id): \(userId) saved to UserDefaults")
//                            completion(true)
//                        } else {
//                            print("Failed to parse JSON or _id not found")
//                            completion(false)
//                        }
//                    } catch {
//                        print("Error parsing response data: \(error)")
//                        completion(false)
//                    }
//                } else {
//                    completion(false)
//                }
