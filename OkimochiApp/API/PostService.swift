import Alamofire
import Moya
import RxSwift
protocol PostServiceProtocol {
    func getLetters(completion:@escaping (Result<[Letter], Error>)->Void)
    func fetchMyPost(completion: @escaping (Result<[Letter],Error>)->Void)
    func postLetter(dic:[String:Any],completion:@escaping(Result<Void,Error>)->Void)
}
struct PostService:PostServiceProtocol {
    func fetchMyPost(token:String)->Single<[Letter]> {
        APIClient.shared.request(PostAPI.getMyLetter(token: token))
    }
    
    func fetchMyPost(completion: @escaping (Result<[Letter],Error>)->Void) {
        guard let token = UserDefaultsRepositry.shared.getToken() else { completion(.failure(APIError.notToken))
            return
        }
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
    }
    
    func getLetters(completion:@escaping (Result<[Letter], Error>)->Void) {
        guard let token = UserDefaultsRepositry.shared.getToken() else {
            completion(.failure(APIError.notToken))
            return
        }
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
    }
//    func postLetter(
    func saveLetter(id:String, completion:@escaping (Result<Void, Error>)->Void) {
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
    }
    
    func deleteLetter(id:String, completion:@escaping (Result<Void, Error>)->Void) {
        guard let token = UserDefaultsRepositry.shared.getToken() else {
            completion(.failure(APIError.notToken))
            return
        }
        let provider = MoyaProvider<PostAPI>()
        provider.request(.delete(id: id, token: token)) { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure:
                completion(.failure(APIError.apiError))
            }
        }
    }
    
    func deleteSavedLetter(id: String,
                                  completion: @escaping (Result<Void,Error>)->Void) {
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
    }
    func postLetter(dic:[String:Any],completion:@escaping(Result<Void,Error>)->Void) {
        guard let token = UserDefaultsRepositry.shared.getToken() else {
            completion(.failure(APIError.notToken))
            return
        }
        let provider = MoyaProvider<PostAPI>()
        provider.request(.post(dic: dic, token: token)) { result in
            switch result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func updateLetter(id:String,letter:Letter,completion:@escaping(Result<Void,Error>)->Void) {
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
    }

}
