import Foundation
import Alamofire

struct PostService {
    static func fetchMyPost(completion:@escaping (Result<[Letter],Error>)->Void) {
        let baseUrl = "https://kobajun029.sakura.ne.jp/laravel1/api/posts"
        guard let token = UserDefaultsRepositry.shared.getToken() else { completion(.failure(APIError.notToken))
            return
        }
        let parameter:[String:Any] = ["token":"\(token)"]
        AF.request(baseUrl,method: .get,parameters: parameter).responseJSON { response in
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                do {
                let letters = try JSONDecoder().decode([Letter].self, from: data)
                completion(.success(letters))
                } catch {
                    completion(.failure(APIError.decodeError))
                }
            case .failure:
                completion(.failure(APIError.apiError))
            }
        }
    }
}
