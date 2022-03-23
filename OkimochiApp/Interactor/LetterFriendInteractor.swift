//
//  LetterFriendInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import Combine

final class LetterFriendInteractor: LetterFriendUseCase {
    let service: UserServiceProtocol
    init(service: UserServiceProtocol) {
        self.service = service
    }
    func fetchFriends(uid: String, token: String) -> Future<UserFriendsViewData, Error> {
        return Future<UserFriendsViewData, Error> { promise in
            self.service.getFriends(token: token).sink(receiveCompletion: { completion in
                switch completion {
                case .finished: print("finish")
                case .failure(let error): promise(.failure(error))
                }
            }, receiveValue: { result in
                promise(.success(result.convertToViewData()))
            })
        }
    }

}
