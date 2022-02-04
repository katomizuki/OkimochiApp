//
//  RegisterTargetType.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/02/04.
//

import Moya

enum RegisterTargetType: APIResponse {
    var para: [String : Any] {
        switch self {
        case .register(let paramas):
            return paramas
        }
    }
    typealias Response = RegisterResponse
    case register(paramas: [String: Any])
    
}

extension RegisterTargetType: TargetType {
    var baseURL: URL {
        return URL(string:"https://kobajun029.sakura.ne.jp")!
    }
    
    var path: String {
        switch self {
        case .register:
            return "okimochi/api/register"
        }
    }
    
    var method: Method {
        .post
    }
    
    var task: Task {
        switch self {
        case .register(let params):
            return .requestParameters(parameters: params, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
