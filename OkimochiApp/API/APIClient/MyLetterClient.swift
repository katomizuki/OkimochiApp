//
//  MyLetterClient.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/25.
//

import Moya
enum MyLetterAPI: APIResponse {
    typealias Response = MyLetterResult
    case fetchMyLetters(token :String)
}
extension MyLetterAPI: TargetType {
    var baseURL: URL {
        return URL(string:"https://kobajun029.sakura.ne.jp")!
    }
    var para: [String : Any] {
        switch self {
        case .fetchMyLetters(let token):
            return ["token": token]
        }
    }
    
    var path: String {
        return "/okimochi/api/mypage"
    }
    
    var method: Method { .get }
    
    var task: Task {
        switch self {
        case .fetchMyLetters(let token):
            return .requestParameters(parameters: ["token": token], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
