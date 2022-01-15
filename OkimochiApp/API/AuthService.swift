import Foundation
import Alamofire
import Moya
protocol AuthServiceProtocol {
    
}
struct AuthService: AuthServiceProtocol {
    
    static func register(credential:Credential,completion:@escaping (Result<Void,Error>)->Void) {
//        let baseURL = "https://kobajun029.sakura.ne.jp/okimochi/api/register"
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
        
        
//        let headers:HTTPHeaders = ["Contenttype": "application/json"]
//        AF.request(baseURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
//            switch response.result {
//            case .success:
//                completion(.success(()))
//            case .failure:
//                completion(.failure(APIError.apiError))
//            }
//        }
    }
    static func login(email:String,password:String,completion:@escaping(Result<AuthResponse,Error>)->Void) {
//        let baseURL = "https://kobajun029.sakura.ne.jp/okimochi/api/login"
        let parameters:[String:Any] = [
            "email" : "\(email)",
            "password" : "\(password)"]
//        let headers: HTTPHeaders = ["Contenttype": "application/json"]
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
//        AF.request(baseURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
//            switch response.result {
//            case .success:
//                guard let data = response.data else { return }
//                do {
//                    let authResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
//                    completion(.success(authResponse))
//                } catch {
//                    completion(.failure(APIError.decodeError))
//                }
//            case .failure:
//                completion(.failure(APIError.apiError))
//            }
//        }
    }
}

