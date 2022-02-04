//
//  PostAPIClient.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/15.
//

import Moya
import Alamofire
enum LetterTargetType {
    case getMyLetter(token:String)
    case save(id:String,token:String)
    case get(token:String)
    case delete(id:String,token:String)
    case update(id:String,token:String,dic:[String:Any])
    case deleteSaved(id:String,token:String)
    case post(dic:[String:Any],token:String)
}
extension LetterTargetType:TargetType, APIResponse {
    
    var para: [String : Any] {
        var para:[String:Any] = [:]
        switch self {
        case .getMyLetter(let token):
            para["token"] = token
        case .save(_,let token):
            para["token"] = token
        case .get(let token):
            para["token"] = token
        case .delete(_, let token):
            para["token"] = token
        case .update(_,_, let dic):
            para = dic
        case .post(let dic,_):
            para = dic
        case .deleteSaved(_,let token):
            para["token"] = token
        }
        return para
    }
    
    typealias Response = [Letter]
    
    var baseURL: URL {
        return URL(string: "https://kobajun029.sakura.ne.jp")!
    }
    
    var path: String {
        switch self {
        case .getMyLetter:
            return "/okimochi/api/mypage"
        case .save(let id,_):
            return "/okimochi/api/save/\(id)"
        case .get:
            return "/okimochi/api/index"
        case .delete(let id,_):
            return "/okimochi/api/delete/\(id)"
        case .update(let id,_,_):
            return "/okimochi/api/update/\(id)"
        case .deleteSaved(let id,_):
            return "/okimochi/api/save/delete/\(id)"
        case .post:
            return "https://kobajun029.sakura.ne.jp/okimochi/api/post"
        }
        
    }
    
    var method: Moya.Method {
        switch self {
        case .delete: return .delete
        default: return .get
        }
    }
    
    
    var task: Task {
        switch self {
        case .getMyLetter(let token):
            return .requestParameters(parameters: ["token":token], encoding: URLEncoding.queryString)
        case .save(_,let token):
            return .requestParameters(parameters: ["token":token], encoding: URLEncoding.queryString)
        case .get(let token):
            return .requestParameters(parameters: ["token":token], encoding: URLEncoding.queryString)
        case .update(_,_,let dic):
            return .requestParameters(parameters: dic, encoding: URLEncoding.queryString)
        case .delete(_,let token):
            return .requestParameters(parameters: ["token":token], encoding: URLEncoding.queryString)
        case .deleteSaved(_, let token):
            return .requestParameters(parameters: ["token":token], encoding: URLEncoding.queryString)
        case .post(let dic,_):
            return .requestParameters(parameters: dic, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
