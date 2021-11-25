import Foundation
import Alamofire
import JWTDecode

struct TestService {
    static func fetchData() {
        let baseURL = "https://kobajun029.sakura.ne.jp/laravel1/api/register"
        let parameters:[String:Any] = [
            "name" : "Mizuki",
            "email" : "mizuki@yahoo.co.jp",
            "password" : "mizukimizuki"]
        let headers: HTTPHeaders = [
                    "Contenttype": "application/json"
                ]
        AF.request(baseURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            print(response.result,"⚡️")
        }
    }
    static func login() {
        let baseURL = "https://kobajun029.sakura.ne.jp/laravel1/api/login"
        let parameters:[String:Any] = [
            "email" : "mizuki@yahoo.co.jp",
            "password" : "mizukimizuki"]
        let headers: HTTPHeaders = ["Contenttype": "application/json"]
        AF.request(baseURL, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                do {
                    let res = try JSONDecoder().decode(Res.self, from: data)
                    print(res)
//                    TestService.decode(token: res.token)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
    static func getUser() {
        let baseURL = "https://kobajun029.sakura.ne.jp/laravel1/api/get_user"
        let header:HTTPHeaders =
        ["Authorization":
            "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczpcL1wva29iYWp1bjAyOS5zYWt1cmEubmUuanBcL2xhcmF2ZWwxXC9hcGlcL2xvZ2luIiwiaWF0IjoxNjM3NzM1NTc0LCJleHAiOjE2Mzc3MzkxNzQsIm5iZiI6MTYzNzczNTU3NCwianRpIjoiYllESW5PbGNGV1NHMmxibCIsInN1YiI6MTIsInBydiI6IjIzYmQ1Yzg5NDlmNjAwYWRiMzllNzAxYzQwMDg3MmRiN2E1OTc2ZjcifQ.VvfOtrQ09DCQ5raj8ZHBswSM46XUe4oTROfAhVSJ_0A"]
        AF.request(baseURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { response in
            print(response.value)

        }
    }
   
     static func decode(token:String) {
        let text:String = "\(token)"
        guard let jwt = try? JWTDecode.decode(jwt: text) else {return}
        let data = jwt.body["user"]
        print(data)
    }
}

struct Res:Decodable {
    var token:String
//    var success:
}
