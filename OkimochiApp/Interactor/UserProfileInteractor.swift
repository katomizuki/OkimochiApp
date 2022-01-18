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
    private let disposeBag = DisposeBag()
    init(service:UserServiceProtocol,postService:PostServiceProtocol) {
        self.service = service
        self.postService = postService
    }
    
    func fetchUser() -> Single<ProfileHeaderViewData> {
        return Single.create { singleEvent->Disposable in
            guard let token = UserDefaultsRepositry.shared.getToken() else { return Disposables.create() }
            self.service.getUser(token: token).subscribe { user in
                singleEvent(.success(ProfileHeaderViewData(user: user)))
            } onFailure: {  error in
                singleEvent(.failure(error))
            }.disposed(by: self.disposeBag)
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
