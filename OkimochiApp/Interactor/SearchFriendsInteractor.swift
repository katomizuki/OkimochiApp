//
//  SearchFriendsInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift


final class SearchFriendsInteractor: SearchFriendUseCase {
    
    
    let service:UserServiceProtocol
    private let disposeBag = DisposeBag()
    init(service:UserServiceProtocol) {
        self.service = service
    }
    
    func searchUser(text: String,token: String) -> Single<[User]> {
        return Single.create { observer -> Disposable in
            self.service.getUsers(token: token).subscribe(onSuccess: { users in
                observer(.success(users.filter({ $0.name.contains(text)} )))
            }, onFailure: { error in
                observer(.failure(error))
            })
        }
    }
    
    func requestFriend(token: String,id: String) -> Completable {
        self.service.requestFriend(token: token, id: id)
    }
    
    
}
