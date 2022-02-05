//
//  RequestFriendTargetType.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/26.
//

import Moya

enum RequestFriendTargetType: APIResponse {
    var para: [String: Any] {
        switch self {
        case .getRequstList(let token):
            return ["token": token]
        }
    }

    typealias Response = RequestFriends
    case getRequstList(token: String)

}
extension RequestFriendTargetType: TargetType {
    var baseURL: URL {
        return URL(string: "https://kobajun029.sakura.ne.jp")!
    }

    var path: String {
        return "okimochi/api/request_list"
    }

    var method: Method {
        .get
    }

    var task: Task {
        switch self {
        case .getRequstList(let token):
            return .requestParameters(parameters: ["token": token], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        return nil
    }

}
