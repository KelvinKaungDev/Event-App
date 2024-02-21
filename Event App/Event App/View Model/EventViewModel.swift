import Foundation
import Alamofire

class EventViewModel: ObservableObject {
    static var shared = EventViewModel()
    
    public func fetchEvents(completion: @escaping (Result<[Events], Error>) -> Void) {
        guard let url = URL(string: "https://events-au.vercel.app/event/getAll") else { return }
        AF.request(url).responseDecodable(of: EventModel.self) { response in
            switch response.result {
            case .success(let unit):
                completion(.success(unit.message))
            case .failure(let userFetchError):
                //                print(userFetcherror.localizedDescription)
                completion(.failure(userFetchError))
            }
        }
    }
    
    public func fetchSingleEvent(eventId: String, completion: @escaping (Result<Event, Error>) -> Void) {
        guard let url = URL(string: "https://events-au.vercel.app/event/getOne/\(eventId)") else { return }
        AF.request(url).responseDecodable(of: SingleEventModel.self) { response in
            switch response.result{
            case .success(let unit):
                completion(.success(unit.message))
            case .failure(let userFetchError):
                completion(.failure(userFetchError))
            }
        }
    }
}
