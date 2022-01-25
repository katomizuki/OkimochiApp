//
//  UpdateProfileInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift
final class UpdateProfileInteractor:UpdateProfileUserCase {
    
    let service: UserServiceProtocol
    init(service:UserServiceProtocol) {
        self.service = service
    }
    func updateUserProfile(user: User, token: String) -> Completable  {
        self.service.updateUser(token: token)
    }
}
