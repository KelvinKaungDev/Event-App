//
//  GetAllEventsByUserIdViewModel.swift
//  Event App
//
//  Created by Austin Xu on 2024/3/4.
//

import Foundation
import Alamofire

class GetAllEventsByUserIdViewModel: ObservableObject{
    static var shared = GetAllEventsByUserIdViewModel()
    
    public func fetchEventsByUserId(userId:String, completion: @escaping(Result<AllEvents, Error>) -> Void) {
        guard let url = URL(string: "https://events-au.vercel.app/user/getOne/65bb2731812a0732d17c2fc4/getAllEventsByUserId") else {return}
        AF.request(url).responseDecodable(of: GetAllEventsByUserIdModel.self) { response in
            switch response.result{
            case .success(let eventData):
                print("Success")
                completion(.success(eventData.message))
            case .failure(let userFetchError):
                print("Fail")
                completion(.failure(userFetchError))
            }
        }
    }
    
}
