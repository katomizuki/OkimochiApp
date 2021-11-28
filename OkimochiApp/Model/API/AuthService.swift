import Foundation
import Alamofire

struct AuthService {
    
    static func register(credential:Credential,completion:@escaping (Result<Void,Error>)->Void) {
        let baseURL = "https://kobajun029.sakura.ne.jp/laravel1/api/register"
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
        let baseURL = "https://kobajun029.sakura.ne.jp/laravel1/api/login"
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
//    Authorization
    static func getUser() {
        let baseURL = "https://kobajun029.sakura.ne.jp/laravel1/api/get_user"
        let parameter:[String:Any] =
        ["token":
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wva29iYWp1bjAyOS5zYWt1cmEubmUuanBcL2xhcmF2ZWwxXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjM4MDY0Nzc3LCJleHAiOjE2MzgwNjgzNzcsIm5iZiI6MTYzODA2NDc3NywianRpIjoiVEdVRllZc2VQTlNYcjY2cSIsInN1YiI6MTIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.93C2iaqdnSaWAvFuwqmpTLOmHSLVI9rZReb3YlqddGc"]
        let headers:HTTPHeaders = ["Contenttype": "application/json"]
        AF.request(baseURL, method: .get, parameters: parameter,headers: headers).responseJSON { response in
            print(response.value,"⚡️")
            print(response,"🌂")

        }
    }
    static func post() {
        let baseUrl = "https://kobajun029.sakura.ne.jp/laravel1/api/posts"
        let parameter:[String:Any] = ["token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wva29iYWp1bjAyOS5zYWt1cmEubmUuanBcL2xhcmF2ZWwxXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjM4MDY0Nzc3LCJleHAiOjE2MzgwNjgzNzcsIm5iZiI6MTYzODA2NDc3NywianRpIjoiVEdVRllZc2VQTlNYcjY2cSIsInN1YiI6MTIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.93C2iaqdnSaWAvFuwqmpTLOmHSLVI9rZReb3YlqddGc"]
        AF.request(baseUrl,method: .get,parameters: parameter).responseJSON { response in
            print(response,"🐶")
        }
    }
}

