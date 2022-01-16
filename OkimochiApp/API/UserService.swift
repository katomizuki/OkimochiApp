import Alamofire
import Moya

protocol UserServiceProtocol {
    func getUser(token: String,
                 completion: @escaping (Result<User, Error>) -> Void) 
}
struct UserService: UserServiceProtocol {

     func getUser(token: String,
                  completion: @escaping (Result<User, Error>) -> Void) {
        let provider = MoyaProvider<UserAPI>()
         provider.request(.getUser(token: token)) { result in
             switch result {
             case .success(let response):
                 do {
                     let user = try JSONDecoder().decode(User.self, from: response.data)
                     completion(.success(user))
                 } catch {
                     completion(.failure(error))
                 }
             case .failure(let error):
                 completion(.failure(error))
             }
         }
     }
}
