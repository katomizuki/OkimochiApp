//
//  SearchFriendsInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift
import Combine
final class SearchFriendsInteractor: SearchFriendUseCase {

    let service: UserServiceProtocol
    private let disposeBag = DisposeBag()
    init(service: UserServiceProtocol) {
        self.service = service
    }

    func searchUser(text: String, token: String) -> Future<[User], Error> {
        return Future<[User], Error> { promise in
            self.service.getUsers(token: token)
                .sink { completion in
                    switch completion {
                    case .finished: print("finish")
                    case .failure(let error): promise(.failure(error))
                    }
                } receiveValue: { users in
                    promise(.success(users.filter({ $0.name.contains(text)})))
                }
        }
    }

    func requestFriend(token: String, id: String) -> Completable {
        self.service.requestFriend(token: token, id: id)
    }

}
