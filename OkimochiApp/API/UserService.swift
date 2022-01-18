import Alamofire
import Moya
import RxSwift

protocol UserServiceProtocol {
    func getUser(token: String)->Single<User>
}
struct UserService: UserServiceProtocol {
    func getUser(token: String)->Single<User> {
        APIClient.shared.request(UserAPI.getUser(token: token))
    }
}
