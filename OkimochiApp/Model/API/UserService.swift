import Foundation
import FirebaseFirestore
import Alamofire

struct UserService {
    //    Authorization
    static func getUser(token:String) {
            let baseURL = "https://kobajun029.sakura.ne.jp/laravel1/api/get_user"
            let parameter:[String:Any] =
            ["token": "\(token)"]
            let headers:HTTPHeaders = ["Contenttype": "application/json"]
            AF.request(baseURL, method: .get, parameters: parameter,headers: headers).responseJSON { response in

            }
        }
}
