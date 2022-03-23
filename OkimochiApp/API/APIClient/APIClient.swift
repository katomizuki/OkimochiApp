//
//  APIClient.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/18.
//

import Moya
import Alamofire
import Combine

class APIClient {
    static let shared = APIClient()
    typealias APITargetType = TargetType & APIResponse

    private init() { }

    func requestCompletable<T: APITargetType>(_ request: T) -> Future<CompletableEntity, Error> {
        return Future<CompletableEntity, Error> { promise in
            let url = request.baseURL.absoluteString + request.path
            AF.request(url, method: request.method, parameters: request.para, encoding: URLEncoding.queryString, headers: nil).responseJSON { response in
                switch response.result {
                case .success:
                    promise(.success(CompletableEntity()))
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
    }

    func request<T: APITargetType>(_ request: T) -> Future<T.Response, Error> {
        return Future<T.Response, Error> { promise in
            let url = request.baseURL.absoluteString + request.path
            AF.request(url, method: request.method, parameters: request.para, encoding: URLEncoding.queryString, headers: nil).responseJSON { response in
                switch response.result {
                case .success:
                    do {
                        if let data = response.data {
                            let entity = try JSONDecoder().decode(T.Response.self, from: data)
                            promise(.success(entity))
                        }
                    } catch {
                        promise(.failure(error))
                    }
                case .failure(let error):
                    promise(.failure(error))
                }
            }
        }
    }
}

struct CompletableEntity {

}
