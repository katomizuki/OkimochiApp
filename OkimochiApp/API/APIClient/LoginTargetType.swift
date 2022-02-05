//
//  AuthAPIClient.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/15.
//

import Moya
enum LoginTargetType: APIResponse {
    typealias Response = LoginResponse
    case login(parameter: [String: Any])
}
extension LoginTargetType: TargetType {
    var baseURL: URL {
        return URL(string: "https://kobajun029.sakura.ne.jp")!
    }
    var para: [String: Any] {
        switch self {
        case .login(let parameter):
            return parameter
        }
    }

    var path: String {
        switch self {
        case .login:return "/okimochi/api/login"
        }
    }

    var method: Method {
        return .post
    }

    var task: Task {
        switch self {
        case .login(let parameter):
            return .requestParameters(parameters: parameter, encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        return ["Contenttype": "application/json"]
    }

}
