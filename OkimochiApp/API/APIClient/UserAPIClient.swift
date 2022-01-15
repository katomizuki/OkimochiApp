//
//  APIClient.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/15.
//

import Moya

enum UserAPI {
    case getUser(token:String)
}
extension UserAPI:TargetType {
    var baseURL: URL {
        return URL(string:"https://kobajun029.sakura.ne.jp")!
    }
    
    var path: String {
        return "/okimochi/api/get_user"
    }
    
    var method: Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .getUser(let token):
            return .requestParameters(parameters: ["token": token], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}

