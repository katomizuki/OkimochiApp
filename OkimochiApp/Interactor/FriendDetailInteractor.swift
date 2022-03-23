//
//  FriendDetailInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/27.
//

import Combine
final class FriendDetailInteractor: FriendDetailUseCase {

    let service: UserServiceProtocol
    init(service: UserServiceProtocol) {
        self.service = service
    }
    func getUserDetail(userId: String) -> Future<User, Error> {
        self.service.getUser(token: "")
    }

    func applyFriend(token: String, id: String) -> Future<CompletableEntity, Error> {
        self.service.requestFriend(token: token, id: id)
    }

    func rejectFriend(token: String, id: String) -> Future<CompletableEntity, Error> {
        self.service.rejectFriend(token: token, id: id)
    }

    func blockFriend(token: String, id: String) -> Future<CompletableEntity, Error> {
        self.service.rejectFriend(token: token, id: id)
    }
}
