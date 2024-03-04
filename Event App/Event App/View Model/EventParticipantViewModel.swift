//
//  EventParticipantViewModel.swift
//  Event App
//
//  Created by Austin Xu on 2024/3/4.
//

import Foundation
import Alamofire

class EventParticipantViewModel: ObservableObject{
    static var shared = EventParticipantViewModel()
    
//    var parameters: [String: String] = [:]
    
    
    public func getEventByOrgId(orgId: String, eventId: String, completion: @escaping(Result<EventParticipant,Error>) -> Void){
        let parameters = [
            "organizerId": orgId,
            "eventId": eventId
        ]
        
        guard let url = URL(string: "https://events-au.vercel.app/event/getEventByOrgId") else {return}
        
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseDecodable(of: EventParticipantModel.self) { response in
            switch response.result{
            case .success(let data):
                completion(.success(data.message))
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
}
