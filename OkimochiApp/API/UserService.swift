import Alamofire
import Moya
import RxSwift
import Combine
protocol UserServiceProtocol {
    func getUser(token: String) -> Future<User, Error>
    func updateUser(token: String) -> Completable
    func getFriends(token: String) -> Future<FriendsResult, Error>
    func requestFriend(token: String, id: String) -> Completable
    func rejectFriend(token: String, id: String) -> Completable
    func getRequestFriends(token: String) -> Future<RequestFriends, Error>
    func getUsers(token: String) -> Future<[User], Error>
}
struct UserService: UserServiceProtocol {

    func getUser(token: String) -> Future<User, Error> {
        APIClient.shared.request(UserTargetType.getUser(token: token))
    }

    func updateUser(token: String) -> Completable {
        APIClient.shared.requestCompletable(UserTargetType.updateUser(token: token))
    }

    func getFriends(token: String) -> Future<FriendsResult, Error> {
        APIClient.shared.request(FriendsTargetType.getFriends(token: token))
    }

    func requestFriend(token: String, id: String) -> Completable {
        APIClient.shared.requestCompletable(FriendsTargetType.requestFriend(token: token, id: id))
    }
    func getRequestFriends(token: String) -> Future<RequestFriends, Error> {
        APIClient.shared.request(RequestFriendTargetType.getRequstList(token: token))
    }
    func rejectFriend(token: String, id: String) -> Completable {
        APIClient.shared.requestCompletable(FriendsTargetType.rejectFriend(token: token, id: id))
    }
    func getUsers(token: String) -> Future<[User], Error> {
        APIClient.shared.request(AllUserTargetType.getAllUser(token: token))
    }
}
