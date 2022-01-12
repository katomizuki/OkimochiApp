//
//  SearchFriendsInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift


final class SearchFriendsInteractor: SearchFriendUseCase {
    let service:UserServiceProtocol
    init(service:UserServiceProtocol) {
        self.service = service
    }
    func searchUser(text: String) -> Single<[User]> {
        return Single.create { SingleEvent->Disposable in
            return Disposables.create()
        }
    }
    
    
}
