import Foundation
import Alamofire
import Moya
protocol AuthServiceProtocol {
    func login(email: String,
               password: String,
               completion: @escaping(Result<AuthResponse, Error>) -> Void)
}
struct AuthService: AuthServiceProtocol {
    
    func register(credential:Credential,completion:@escaping (Result<Void,Error>)->Void) {
        let parameters:[String:Any] = ["name" : credential.name,
                                       "email" : credential.email,
                                       "password" : credential.password]
        let provider = MoyaProvider<AuthAPI>()
        provider.request(.register(parameter: parameters)) { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func login(email: String,
                      password: String,
                      completion: @escaping(Result<AuthResponse, Error>) -> Void) {
        let parameters:[String:Any] = [
            "email" : "\(email)",
            "password" : "\(password)"]
        let provider = MoyaProvider<AuthAPI>()
        provider.request(.login(parameter: parameters)) { result in
            switch result {
            case .success(let response):
                do {
                    let authResponse = try JSONDecoder().decode(AuthResponse.self, from: response.data)
                    completion(.success(authResponse))
                } catch {
                    completion(.failure(APIError.decodeError))
                }
            case .failure:
                completion(.failure(APIError.apiError))
            }
        }
    }
}

