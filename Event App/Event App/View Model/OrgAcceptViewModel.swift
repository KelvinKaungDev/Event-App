//
//  OrgAcceptViewModel.swift
//  Event App
//
//  Created by Austin Xu on 2024/3/4.
//

import Foundation
import Alamofire

class OrgAcceptViewModel: ObservableObject{
    static var shared = OrgAcceptViewModel()
    
    public func acceptParticipant(orgId: String, eventId: String, participantId: String) {
        guard let url = URL(string: "https://events-au.vercel.app/org/\(orgId)/acceptJoinEvent/\(eventId)") else {return}
        
        let parameters: [String: [String]] = [
            "pendingParticipantIds": [participantId]
        ]
        
        AF.request(url, method: .put, parameters: parameters, encoding: JSONEncoding.default).response { response in
            switch response.result{
            case .success(_):
                print("Accepted")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}
