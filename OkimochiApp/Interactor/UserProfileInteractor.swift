//
//  UserProfileInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift

final class UserProfileInteractor:UserProfileUseCase {
    let service:UserServiceProtocol
    init(service:UserServiceProtocol) {
        self.service = service
    }
    func fetchUser() -> Single<User> {
        return Single.create { singleEvent->Disposable in
            return Disposables.create()
        }
    }
    
    func fetchMyLetter() -> Single<[Letter]> {
        return Single.create { singleEvent->Disposable in
            return Disposables.create()
        }
    }
    
   
}
