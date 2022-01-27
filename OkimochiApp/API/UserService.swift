import Alamofire
import Moya
import RxSwift

protocol UserServiceProtocol {
    func getUser(token: String) -> Single<User>
    func updateUser(token :String) -> Completable
    func getFriends(token: String) -> Single<FriendsResult>
    func requestFriend(token: String,id: String) -> Completable
    func rejectFriend(token: String,id: String) -> Completable
    func getRequestFriends(token: String) -> Single<RequestFriends>
    func getUsers(token: String) -> Single<[User]>
}
struct UserService: UserServiceProtocol {
    
    func getUser(token: String) -> Single<User> {
        APIClient.shared.request(UserAPI.getUser(token: token))
    }
    func updateUser(token: String) -> Completable {
        APIClient.shared.requestCompletable(UserAPI.updateUser(token: token))
    }
    func getFriends(token: String) -> Single<FriendsResult> {
        APIClient.shared.request(FriendsTargetType.getFriends(token: token))
    }
    func requestFriend(token: String, id: String) -> Completable {
        APIClient.shared.requestCompletable(FriendsTargetType.requestFriend(token: token, id: id))
    }
    func getRequestFriends(token: String) -> Single<RequestFriends> {
        APIClient.shared.request(RequestFriendTargetType.getRequstList(token: token))
    }
    func rejectFriend(token: String, id: String) -> Completable {
        APIClient.shared.requestCompletable(FriendsTargetType.rejectFriend(token: token, id: id))
    }
    func getUsers(token: String) -> Single<[User]> {
        APIClient.shared.request(AllUserTargetType.getAllUser(token: token))
    }
}
