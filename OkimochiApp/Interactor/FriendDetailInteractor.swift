//
//  FriendDetailInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/27.
//

import RxSwift

final class FriendDetailInteractor: FriendDetailUseCase {

    let service: UserServiceProtocol
    init(service: UserServiceProtocol) {
        self.service = service
    }
    func getUserDetail(userId: String) -> Single<User> {
        self.service.getUser(token: "")
    }

    func applyFriend(token: String, id: String) -> Completable {
        self.service.requestFriend(token: token, id: id)
    }

    func rejectFriend(token: String, id: String) -> Completable {
        self.service.rejectFriend(token: token, id: id)
    }

    func blockFriend(token: String, id: String) -> Completable {
        self.service.rejectFriend(token: token, id: id)
    }
}
