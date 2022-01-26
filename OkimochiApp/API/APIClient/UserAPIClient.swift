//
//  APIClient.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/15.
//

import Moya
protocol APIResponse {
    associatedtype Response:Decodable
    var para:[String: Any] { get }
}

enum UserAPI:APIResponse {
    var para: [String : Any] {
        var para:[String:Any] = [:]
        switch self {
        case .getUser(let token):
            para["token"] = token
        case .updateUser(let token):
            para["token"] = token
        }
        return para
    }
    
    typealias Response = User
    
    case getUser(token:String)
    case updateUser(token: String)
    
}
extension UserAPI:TargetType {
    var baseURL: URL {
        return URL(string:"https://kobajun029.sakura.ne.jp")!
    }
    
    var path: String {
        switch self {
        case .getUser:
            return "/okimochi/api/get_user"
        case .updateUser:
            return "/okimochi/api/update_user"
        }
        
    }
    
    var method: Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .getUser(let token):
            return .requestParameters(parameters: ["token": token], encoding: URLEncoding.queryString)
        case .updateUser(let token):
            return .requestParameters(parameters: ["token": token], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

