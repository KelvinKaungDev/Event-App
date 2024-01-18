import Foundation
import Alamofire

class AdminViewModel {
    
    var shared = AdminViewModel()
    
    public func fetchAllAdmins(completion: @escaping (Result<[Admin], Error>) -> Void) {
        guard let url = URL(string: "https://events-au.vercel.app/admin/getAll") else { return }
        AF.request(url).responseDecodable(of: AdminModel.self) { response in
            switch response.result {
            case .success(let adminData):
                completion(.success(adminData.message))
            case .failure(let userFetcherror):
                completion(.failure(userFetcherror))
            }
        }
    }
    
    public func fetchSingleAdmin(adminId: String,completion: @escaping (Result<SingleAdmin, Error>) -> Void) {
        guard let url = URL(string: "https://events-au.vercel.app/admin/getOne/\(adminId)") else { return }
        AF.request(url).responseDecodable(of: AdminGetOneModel.self) { response in
            switch response.result {
            case .success(let adminData):
                completion(.success(adminData.message))
            case .failure(let userFetcherror):
                completion(.failure(userFetcherror))
            }
        }
    }
    
    public func deleteAdmin(adminId: String, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let url = URL(string: "https://events-au.vercel.app/admin/delete/\(adminId)") else { return }
        AF.request(url, method: .delete).response { response in
            switch response.result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
