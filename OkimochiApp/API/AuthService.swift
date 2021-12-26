import Foundation
import Alamofire

struct AuthService {
    
    static func register(credential:Credential,completion:@escaping (Result<Void,Error>)->Void) {
        let baseURL = "https://kobajun029.sakura.ne.jp/okimochi/api/register"
        let parameters:[String:Any] = ["name" : credential.name,
                                       "email" : credential.email,
                                       "password" : credential.password]
        let headers:HTTPHeaders = ["Contenttype": "application/json"]
        AF.request(baseURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                completion(.success(()))
            case .failure:
                completion(.failure(APIError.apiError))
            }
        }
    }
    static func login(email:String,password:String,completion:@escaping(Result<AuthResponse,Error>)->Void) {
        let baseURL = "https://kobajun029.sakura.ne.jp/okimochi/api/login"
        let parameters:[String:Any] = [
            "email" : "\(email)",
            "password" : "\(password)"]
        let headers: HTTPHeaders = ["Contenttype": "application/json"]
        AF.request(baseURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                do {
                    let authResponse = try JSONDecoder().decode(AuthResponse.self, from: data)
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

