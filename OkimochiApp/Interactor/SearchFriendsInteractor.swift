//
//  SearchFriendsInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift


final class SearchFriendsInteractor:SearchFriendUseCase {
    func searchUser(text: String) -> Single<[User]> {
        return Single.create { SingleEvent->Disposable in
            return Disposables.create()
        }
    }
    
    
}
