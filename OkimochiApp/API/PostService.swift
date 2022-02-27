import Alamofire
import Moya
import RxSwift

protocol PostServiceProtocol {
    func fetchMyPost(token: String)->Single<MyLetterResult>
    func getLetters(token: String)->Single<[Letter]>
    func saveLetter(id: String, token: String) -> Completable
    func deleteLetter(id: String, token: String) -> Completable
    func deleteSavedLetter(id: String, token: String) -> Completable
    func postLetter(dic: [String: Any], token: String) -> Completable
    func updateLetter(id: String, token: String, parameter: [String: Any]) -> Completable
}
struct PostService: PostServiceProtocol {

    func fetchMyPost(token: String)->Single<MyLetterResult> {
        APIClient.shared.request(MyLetterTargetType.fetchMyLetters(token: token))
    }

    func getLetters(token: String)->Single<[Letter]> {
        APIClient.shared.request(LetterTargetType.get(token: token))
    }

    func saveLetter(id: String, token: String) -> Completable {
        APIClient.shared.requestCompletable(LetterTargetType.save(id: id, token: token))
    }

    func deleteLetter(id: String, token: String) -> Completable {
        APIClient.shared.requestCompletable(LetterTargetType.delete(id: id, token: token))
    }

    func deleteSavedLetter(id: String, token: String) -> Completable {
        APIClient.shared.requestCompletable(LetterTargetType.delete(id: id, token: token))
    }

    func postLetter(dic: [String: Any], token: String) -> Completable {
        APIClient.shared.requestCompletable(LetterTargetType.post(dic: dic, token: token))
    }
    func updateLetter(id: String, token: String, parameter: [String: Any]) -> Completable {
        return APIClient.shared.requestCompletable(LetterTargetType.update(id: id, token: token, dic: parameter))
    }

}
