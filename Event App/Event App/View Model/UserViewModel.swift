import Foundation
import Observation
import Alamofire

@Observable class UserViewModel {
    static var shared = UserViewModel()
    var users = [Users]()
    
    public func fetchAllUsers(completion: @escaping ([Users]) -> Void) {
        guard let url = URL(string: "https://events-mnh4cd7dd-u6511923-auedu.vercel.app/user/getAll") else { return }
        AF.request(url).responseDecodable(of: UserModel.self) { response in
            switch response.result {
            case .success(let userData):
                completion(userData.message)
            case .failure(let userFetcherror):
                print("Error \(userFetcherror)")
            }
        }
    }
    
    public func fetchSingleUser(userId : String) {
        guard let url = URL(string: "https://events-8wgk5vo1o-u6511923-auedu.vercel.app/user/getOne/\(userId)") else { return }
        AF.request(url).responseDecodable(of: SingleUserModel.self) { response in
            switch response.result {
            case .success(let userData):
                print(userData.message)
            case .failure(let userFetcherror):
                print("Error \(userFetcherror)")
            }
        }
    }
    
    public func fetchUserPopulate(userId: String, completion: @escaping (Result<Populate, Error>) -> Void){
        guard let url = URL(string: "https://events-au.vercel.app/user/getOne/\(userId)/populateAll") else { fatalError("Error") }
        AF.request(url).responseDecodable(of: UserPopulateModel.self) { response in
            switch response.result {
            case .success(let userData):
                completion(.success(userData.message))
            case .failure(let userFetcherror):
                completion(.failure(userFetcherror))
            }
        }
    }
    
    public func fetchUserPopulateUnit(userId: String, completion: @escaping (Result<PopulateUnit, Error>) -> Void){
        guard let url = URL(string: "https://events-au.vercel.app/user/getOne/\(userId)/populateUnits") else { fatalError("Error") }
        AF.request(url).responseDecodable(of: UserPopulateUnitModel.self) { response in
            switch response.result {
            case .success(let userData):
                completion(.success(userData.message))
            case .failure(let userFetcherror):
                completion(.failure(userFetcherror))
            }
        }
    }
    
    public func fetchUserPopulateEventList(userId: String, completion: @escaping (Result<PopulateEventList, Error>) -> Void) {
        guard let url = URL(string: "https://events-au.vercel.app/user/getOne/\(userId)/populateEventlist") else { fatalError("Error") }
        AF.request(url).responseDecodable(of: UserPopulateEventListModel.self) { response in
            switch response.result {
            case .success(let userData):
                completion(.success(userData.message))
            case .failure(let userFetcherror):
                completion(.failure(userFetcherror))
            }
        }
    }
    
    public func deleteUser(userId: String, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let url = URL(string: "https://events-au.vercel.app/user/delete/\(userId)") else { fatalError("Error") }
        AF.request(url, method: .delete).response { response in
            switch response.result {
                case .success:
                    completion(.success(()))
                case .failure (let error):
                    completion(.failure(error))
            }
        }
    }
}
