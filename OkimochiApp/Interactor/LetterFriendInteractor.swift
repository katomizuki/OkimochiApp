//
//  LetterFriendInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import RxSwift


final class LetterFriendInteractor:LetterFriendUseCase {
    let service:UserServiceProtocol
    init(service:UserServiceProtocol) {
        self.service = service
    }
    func fetchFriends(uid: String, token: String) -> Single<UserFriendsViewData> {
        return Single.create { singleEvent->Disposable in
            self.service.getFriends(token: token).subscribe { result in
                singleEvent(.success(result.convertToViewData()))
            } onFailure: { error in
                singleEvent(.failure(error))
            }
        }
    }

}
