//
//  AllUserTargetType.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/27.
//

import Moya

enum AllUserTargetType: APIResponse {

    var para: [String: Any] {
        switch self {
        case .getAllUser(let token):
            return ["token": token]
        }
    }

    typealias Response = [User]
    case getAllUser(token: String)

}
extension AllUserTargetType: TargetType {
    var baseURL: URL {
        return URL(string: "https://kobajun029.sakura.ne.jp")!
    }

    var path: String {
        return "okimochi/api/get_users"
    }

    var method: Method {
        .get
    }

    var task: Task {
        switch self {
        case .getAllUser(let token):
            return .requestParameters(parameters: ["token": token], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        return nil
    }

}
