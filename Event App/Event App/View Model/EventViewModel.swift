import Foundation
import Alamofire

class EventViewModel {
    
    public func fetchEvents(completion: @escaping ([Events]) -> ()) {
        guard let url = URL(string: "https://events-au.vercel.app/event/getAll") else { return }
        AF.request(url).responseDecodable(of: EventModel.self) { response in
            switch response.result {
            case .success(let unit):
                completion(unit.message)
            case .failure(let userFetcherror):
                print(userFetcherror.localizedDescription)
            }
        }
    }
}
