//
//  APIClient.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/18.
//

import Moya
import Alamofire
import RxSwift
import Combine
// protocol APICli
class APIClient {
    static let shared = APIClient()
    typealias APITargetType = TargetType & APIResponse

    private init() { }

    func request<T: APITargetType>(_ request: T) ->Single<T.Response> {
        return Single.create { observer->Disposable in
            let url = request.baseURL.absoluteString + request.path
            print(request.baseURL, request.path)
            AF.request(url, method: request.method, parameters: request.para, encoding: URLEncoding.queryString, headers: nil).responseJSON { response in
                switch response.result {
                case .success:
                    do {
                        if let data = response.data {
                            let entity = try JSONDecoder().decode(T.Response.self, from: data)
                            observer(.success(entity))
                        }
                    } catch {
                        observer(.failure(error))
                    }
                case .failure(let error):
                    observer(.failure(error))
                }
            }
            return Disposables.create()
        }
    }

    func requestCompletable<T: APITargetType>(_ request: T) -> Completable {
        Completable.create { subscriber -> Disposable in
            let url = request.path
            AF.request(url, method: request.method, parameters: request.para, encoding: URLEncoding.queryString, headers: nil).responseJSON { response in
                switch response.result {
                case .success:
                    subscriber(.completed)
                case .failure(let error):
                    subscriber(.error(error))
                }
            }
            return Disposables.create()
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
