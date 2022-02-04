//
//  AuthAPIClient.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/15.
//

import Moya
enum AuthAPI: APIResponse {
    typealias Response = LoginResponse
    case register(parameter:[String:Any])
    case login(parameter:[String:Any])
}
extension AuthAPI: TargetType {
    var baseURL: URL {
        return URL(string:"https://kobajun029.sakura.ne.jp")!
    }
    var para: [String : Any] {
        switch self {
        case .register(let parameter):
            return parameter
        case .login(let parameter):
            return parameter
        }
    }
    
    var path: String {
        switch self {
        case .register:return "/okimochi/api/register"
        case .login:return "/okimochi/api/login"
        }
    }
    
    var method: Method {
        return .post
    }
    
    var task: Task {
        switch self {
        case .register(let parameter):
            return .requestParameters(parameters: parameter, encoding: URLEncoding.queryString)
        case .login(let parameter):
            return .requestParameters(parameters: parameter, encoding: URLEncoding.queryString)
        }
    }
   
    
    var headers: [String : String]? {
        return ["Contenttype": "application/json"]
    }
    
}
