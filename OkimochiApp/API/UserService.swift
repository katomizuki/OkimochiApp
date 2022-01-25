import Alamofire
import Moya
import RxSwift

protocol UserServiceProtocol {
    func getUser(token: String) -> Single<User>
    func updateUser(token :String) -> Completable
}
struct UserService: UserServiceProtocol {
    func getUser(token: String) -> Single<User> {
        APIClient.shared.request(UserAPI.getUser(token: token))
    }
    func updateUser(token: String) -> Completable {
        APIClient.shared.request(UserAPI.updateUser(token: token))
    }
}
