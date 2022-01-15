
import Alamofire
import Moya
protocol UserServiceProtocol {
    
}
struct UserService: UserServiceProtocol {

     func getUser(token:String,completion:@escaping(Result<User,Error>)->Void) {
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
        }
}
