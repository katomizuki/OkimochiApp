//
//  UpdateProfileInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift
final class UpdateProfileInteractor:UpdateProfileUserCase {
    
    let service: UserServiceProtocol
    private let disposeBag = DisposeBag()
    init(service:UserServiceProtocol) {
        self.service = service
    }
    func updateUserProfile(user: User, token: String) -> Completable  {
        self.service.updateUser(token: token)
    }
    func getUser(token: String) -> Single<UserViewData> {
        return Single.create { observer -> Disposable in
            self.service.getUser(token: token).subscribe { user in
                observer(.success(UserViewData(user: user)))
            } onFailure: { error in
                observer(.failure(error))
            }
        }
    }
}
