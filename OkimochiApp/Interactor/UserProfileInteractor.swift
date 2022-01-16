//
//  UserProfileInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift

final class UserProfileInteractor:UserProfileUseCase {
    let service:UserServiceProtocol
    let postService:PostServiceProtocol
    init(service:UserServiceProtocol,postService:PostServiceProtocol) {
        self.service = service
        self.postService = postService
    }
    
    func fetchUser() -> Single<ProfileHeaderViewData> {
        return Single.create { singleEvent->Disposable in
            guard let token = UserDefaultsRepositry.shared.getToken() else { return Disposables.create() }
            self.service.getUser(token: token) { result in
                switch result {
                case .success(let user):
                    singleEvent(.success(ProfileHeaderViewData(user: user)))
                case .failure(let error):
                    singleEvent(.failure(error))
                }
            }
            return Disposables.create()
        }
    }
    
    func fetchMyLetter() -> Single<[Letter]> {
        return Single.create { singleEvent->Disposable in
            self.postService.fetchMyPost { result in
                switch result {
                case .success(let letters):
                    singleEvent(.success(letters))
                case .failure(let error):
                    singleEvent(.failure(error))
                }
            }
            return Disposables.create()
        }
    }
    
   
}
