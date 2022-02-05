//
//  FriendsTargetType.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/26.
//

import Moya

enum FriendsTargetType: APIResponse {
    var para: [String: Any] {
        switch self {
        case .getFriends(let token):
            return ["token": token]
        case .requestFriend(let token, _):
            return ["token": token]
        case .rejectFriend(let token, _):
            return ["token": token]
        }
    }

    typealias Response = FriendsResult
    case getFriends(token: String)
    case requestFriend(token: String, id: String)
    case rejectFriend(token: String, id: String)
}
extension FriendsTargetType: TargetType {
    var baseURL: URL {
        return URL(string: "https://kobajun029.sakura.ne.jp")!
    }

    var path: String {
        switch self {
        case .getFriends:
            return "okimochi/api/friends_list"
        case .requestFriend(_, let id):
            return "okimochi/api/request/\(id)"
        case .rejectFriend(_, let id):
            return "okimochi/api/reject/\(id)"
        }

    }

    var method: Method {
        .get
    }

    var task: Task {
        switch self {
        case .getFriends(let token):
            return .requestParameters(parameters: ["token": token], encoding: URLEncoding.queryString)
        case .requestFriend(let token, _):
            return .requestParameters(parameters: ["token": token], encoding: URLEncoding.queryString)
        case .rejectFriend(let token, _):
            return .requestParameters(parameters: ["token": token], encoding: URLEncoding.queryString)
        }
    }

    var headers: [String: String]? {
        return nil
    }

}
