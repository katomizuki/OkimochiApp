import Alamofire
import Moya
protocol PostServiceProtocol {
    
}
struct PostService:PostServiceProtocol {
    static func fetchMyPost(completion:@escaping (Result<[Letter],Error>)->Void) {
//        let baseUrl = "https://kobajun029.sakura.ne.jp/okimochi/api/mypage"
        guard let token = UserDefaultsRepositry.shared.getToken() else { completion(.failure(APIError.notToken))
            return
        }
//        let parameter:[String:Any] = ["token":"\(token)"]
        let provider = MoyaProvider<PostAPI>()
        provider.request(.getMyLetter(token: token)) { result in
            switch result {
            case .success(let response):
                do {
                    let letters = try JSONDecoder().decode([Letter].self, from: response.data)
                    completion(.success(letters))
                } catch {
                    completion(.failure(APIError.decodeError))
                }
            case .failure:
                completion(.failure(APIError.apiError))
            }
        }
//        AF.request(baseUrl,method: .get,parameters: parameter).responseJSON { response in
//            switch response.result {
//            case .success:
//                guard let data = response.data else { return }
//                do {
//                let letters = try JSONDecoder().decode([Letter].self, from: data)
//                completion(.success(letters))
//                } catch {
//                    completion(.failure(APIError.decodeError))
//                }
//            case .failure:
//                completion(.failure(APIError.apiError))
//            }
//        }
    }
    static func getLetters(completion:@escaping (Result<[Letter], Error>)->Void) {
//        let url = "https://kobajun029.sakura.ne.jp/okimochi/api/index"
        guard let token = UserDefaultsRepositry.shared.getToken() else {
            completion(.failure(APIError.notToken))
            return
        }
//        let parameter:[String:Any] = ["token":token]
        let provider = MoyaProvider<PostAPI>()
        provider.request(.get(token: token)) { result in
            switch result {
            case .success(let response):
                do {
                    let decodedData = try JSONDecoder().decode([Letter].self, from: response.data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(APIError.decodeError))
                }
            case .failure:
                completion(.failure(APIError.apiError))
            }
        }
//        AF.request(url, method: .get, parameters: parameter).responseJSON { response in
//            switch response.result {
//            case .success:
//                do {
//                    guard let data = response.data else { return }
//                    let decodedData = try JSONDecoder().decode([Letter].self, from: data)
//                    completion(.success(decodedData))
//                } catch {
//                    completion(.failure(APIError.decodeError))
//                }
//            case .failure:
//                completion(.failure(APIError.apiError))
//            }
//        }
    }
    static func saveLetter(id:String, completion:@escaping (Result<Void, Error>)->Void) {
//        let url = "https://kobajun029.sakura.ne.jp/okimochi/api/save/\(id)"
        guard let token = UserDefaultsRepositry.shared.getToken() else { completion(.failure(APIError.notToken))
            return
        }
        let provider = MoyaProvider<PostAPI>()
        provider.request(.save(id: id, token: token)) { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure:
                completion(.failure(APIError.apiError))
            }
        }
//        let parameter:[String:Any] = ["token":"\(token)"]
//        AF.request(url, method: .get, parameters: parameter).responseJSON { response in
//            switch response.result {
//            case .success:
//                completion(.success(()))
//            case .failure:
//                completion(.failure(APIError.apiError))
//            }
//        }
    }
    static func deleteLetter(id:String, completion:@escaping (Result<Void, Error>)->Void) {
//        let url = "https://kobajun029.sakura.ne.jp/okimochi/api/delete/\(id)"
        guard let token = UserDefaultsRepositry.shared.getToken() else {
            completion(.failure(APIError.notToken))
            return
        }
//        let parameter:[String:Any] = ["token":token]
        let provider = MoyaProvider<PostAPI>()
        provider.request(.delete(id: id, token: token)) { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure:
                completion(.failure(APIError.apiError))
            }
        }
//        AF.request(url, method: .delete, parameters: parameter).response { response in
//            switch response.result {
//            case .success:
//                completion(.success(()))
//            case .failure:
//                completion(.failure(APIError.apiError))
//            }
//        }
    }
    static func deleteSavedLetter(id: String,
                                  completion: @escaping (Result<Void,Error>)->Void) {
//        let url = "https://kobajun029.sakura.ne.jp/okimochi/api/save/delete/\(id)"
        guard let token = UserDefaultsRepositry.shared.getToken() else {
            completion(.failure(APIError.notToken))
            return
        }
        let provider = MoyaProvider<PostAPI>()
        provider.request(.deleteSaved(id: id, token: token)) { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure:
                completion(.failure(APIError.apiError))
            }
        }
//        let parameter:[String:Any] = ["token":token]
//        AF.request(url, method: .delete, parameters: parameter).response { response in
//            switch response.result {
//            case .success:
//                completion(.success(()))
//            case .failure:
//                completion(.failure(APIError.apiError))
//            }
//        }
    }
    static func updateLetter(id:String,letter:Letter,completion:@escaping(Result<Void,Error>)->Void) {
//        let url = "https://kobajun029.sakura.ne.jp/okimochi/api/update/\(id)"
        guard let token = UserDefaultsRepositry.shared.getToken() else {
            completion(.failure(APIError.notToken))
            return
        }
        let parameter:[String:Any] = ["who":letter.who,
                                      "title":letter.title,
                                      "message":letter.text,
                                      "pic_name":letter.imageUrl,
                                      "open_time":letter.openTime,
                                      "open_place_name":letter.openPlaceName,
                                      "open_place_latitude":letter.latitude,
                                      "open_place_longitude":letter.longitude,
                                      "public":"0",
                                      "token":token]
        let provider = MoyaProvider<PostAPI>()
        provider.request(.update(id: id, token: token, dic: parameter)) { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure:
                completion(.failure(APIError.apiError))
            }
        }
//        AF.request(url, method: .put, parameters: parameter).response { response in
//            switch response.result {
//            case .success:
//                completion(.success(()))
//            case .failure:
//                completion(.failure(APIError.apiError))
//            }
//        }
    }
}
