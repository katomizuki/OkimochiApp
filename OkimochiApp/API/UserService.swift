//import Foundation
//import Alamofire
//
//struct UserService {
//    //    Authorization
//    static func getUser(token:String,completion:@escaping(Result<User,Error>)->Void) {
//            let baseURL = "https://kobajun029.sakura.ne.jp/laravel1/api/get_user"
//            let parameter:[String:Any] =
//            ["token": "\(token)"]
//            let headers:HTTPHeaders = ["Contenttype": "application/json"]
//            AF.request(baseURL, method: .get, parameters: parameter,headers: headers).responseJSON { response in
//                switch response.result {
//                case .success:
//                    guard let data = response.data else { return }
//                    do {
//                    let user = try JSONDecoder().decode(User.self, from: data)
//                        completion(.success(user))
//                    } catch {
//                        completion(.failure(APIError.decodeError))
//                    }
//                case .failure:
//                    completion(.failure(APIError.apiError))
//                }
//            }
//        }
//}
