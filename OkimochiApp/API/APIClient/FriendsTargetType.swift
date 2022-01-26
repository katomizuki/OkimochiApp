//
//  FriendsTargetType.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/26.
//

import Moya

enum FriendsTargetType: APIResponse {
    var para: [String : Any] {
        switch self {
        case .getFriends(let token):
            return ["token": token]
        }
    }
    
    typealias Response = FriendsResult
    case getFriends(token: String)
}
extension FriendsTargetType: TargetType {
    var baseURL: URL {
        return URL(string:"https://kobajun029.sakura.ne.jp")!
    }
    
    var path: String {
        return "okimochi/api/friends_list"
    }
    
    var method: Method {
        .get
    }
    
    var task: Task {
        switch self {
        case .getFriends(let token):
            return .requestParameters(parameters: ["token": token], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
