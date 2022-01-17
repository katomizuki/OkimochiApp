import Foundation
import Alamofire
import Moya
protocol AuthServiceProtocol {
    func login(email: String,
               password: String,
               completion: @escaping(Result<AuthResponse, Error>) -> Void)
    func register(credential: Credential,
                  completion: @escaping (Result<AuthResponse, Error>) -> Void)
}
struct AuthService: AuthServiceProtocol {
    
    func register(credential:Credential,completion:@escaping (Result<AuthResponse, Error>) -> Void) {
        let parameters:[String:Any] = ["name" : credential.name,
                                       "email" : credential.email,
                                       "password" : credential.password]
        let provider = MoyaProvider<AuthAPI>()
        provider.request(.register(parameter: parameters)) { result in
            switch result {
            case .success:
                print("成功！")
                self.login(email: credential.email, password: credential.password, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func login(email: String,
                      password: String,
                      completion: @escaping(Result<AuthResponse, Error>) -> Void) {
        print(#function)
        let parameters:[String:Any] = [
            "email" : "\(email)",
            "password" : "\(password)"]
        let provider = MoyaProvider<AuthAPI>()
        provider.request(.login(parameter: parameters)) { result in
            switch result {
            case .success(let response):
                print(response)
                do {
                    let authResponse = try JSONDecoder().decode(AuthResponse.self, from: response.data)
                    print(authResponse)
                    completion(.success(authResponse))
                } catch {
                    print(APIError.decodeError)
                    completion(.failure(APIError.decodeError))
                }
            case .failure:
                print(APIError.apiError)
                completion(.failure(APIError.apiError))
            }
        }
    }
}

