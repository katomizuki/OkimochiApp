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
    func fetchFriends(uid: String) -> Single<[User]> {
        return Single.create { singleEvent->Disposable in
            return Disposables.create()
        }
    }

}
