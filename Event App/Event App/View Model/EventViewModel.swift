import Foundation
import Alamofire

class EventViewModel: ObservableObject {
    
    public func fetchEvents(completion: @escaping (Result<[Events], Error>) -> Void) {
        guard let url = URL(string: "https://events-au.vercel.app/event/getAll") else { return }
        AF.request(url).responseDecodable(of: EventModel.self) { response in
            switch response.result {
            case .success(let unit):
                completion(.success(unit.message))
            case .failure(let userFetcherror):
                //                print(userFetcherror.localizedDescription)
                completion(.failure(userFetcherror))
            }
        }
    }
}
