import Alamofire
import Moya
import Combine

protocol PostServiceProtocol {
    func fetchMyPost(token: String) -> Future<MyLetterResult, Error>
    func getLetters(token: String) -> Future<[Letter], Error>
    func saveLetter(id: String, token: String) -> Future<CompletableEntity, Error>
    func deleteLetter(id: String, token: String) -> Future<CompletableEntity, Error>
    func deleteSavedLetter(id: String, token: String) -> Future<CompletableEntity, Error>
    func postLetter(dic: [String: Any], token: String) -> Future<CompletableEntity, Error>
    func updateLetter(id: String, token: String, parameter: [String: Any]) -> Future<CompletableEntity, Error>
}

struct PostService: PostServiceProtocol {

    func fetchMyPost(token: String) -> Future<MyLetterResult, Error> {
        APIClient.shared.request(MyLetterTargetType.fetchMyLetters(token: token))
    }

    func getLetters(token: String) -> Future<[Letter], Error> {
        APIClient.shared.request(LetterTargetType.get(token: token))
    }

    func saveLetter(id: String, token: String) -> Future<CompletableEntity, Error> {
        APIClient.shared.requestCompletable(LetterTargetType.save(id: id, token: token))
    }

    func deleteLetter(id: String, token: String) -> Future<CompletableEntity, Error> {
        APIClient.shared.requestCompletable(LetterTargetType.delete(id: id, token: token))
    }

    func deleteSavedLetter(id: String, token: String) -> Future<CompletableEntity, Error> {
        APIClient.shared.requestCompletable(LetterTargetType.delete(id: id, token: token))
    }

    func postLetter(dic: [String: Any], token: String) -> Future<CompletableEntity, Error> {
        APIClient.shared.requestCompletable(LetterTargetType.post(dic: dic, token: token))
    }
    func updateLetter(id: String, token: String, parameter: [String: Any]) -> Future<CompletableEntity, Error> {
        return APIClient.shared.requestCompletable(LetterTargetType.update(id: id, token: token, dic: parameter))
    }

}
