import Foundation
import Alamofire
 
class UnitViewModel: ObservableObject{
    
//    var shared = UnitViewModel()
    
    public func fetchAllUnits(completion: @escaping (Result<[Units], Error>) -> Void) {
        guard let url = URL(string: "https://events-au.vercel.app/unit/getAll") else { return }
        AF.request(url).responseDecodable(of: UnitModel.self) { response in
            switch response.result {
            case .success(let unit):
                completion(.success(unit.message))
            case .failure(let userFetcherror):
                completion(.failure(userFetcherror))
            }
        }
    }
    
    public func fetchSingleUnit(unitId: String,completion: @escaping (Result<[Unit], Error>) -> Void) {
        guard let url = URL(string: "https://events-au.vercel.app/unit/getOne/\(unitId)") else { return }
        AF.request(url).responseDecodable(of: SinglUnitModel.self) { response in
            switch response.result {
            case .success(let unit):
                completion(.success(unit.message))
            case .failure(let userFetcherror):
                completion(.failure(userFetcherror))
            }
        }
    }
}
