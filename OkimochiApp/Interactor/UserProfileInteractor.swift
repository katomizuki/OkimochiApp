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
    
    func fetchUser(token:String) -> Single<ProfileHeaderViewData> {
        return Single.create { singleEvent->Disposable in
            self.service.getUser(token: token).subscribe { user in
                singleEvent(.success(ProfileHeaderViewData(user: user)))
            } onFailure: {  error in
                singleEvent(.failure(error))
            }.disposed(by: self.disposeBag)
            return Disposables.create()
        }
    }
    
    func fetchMyLetter(token: String) -> Single<UserLetterViewData> {
        return Single.create { observer -> Disposable in
            self.postService.fetchMyPost(token: token).subscribe { result in
                observer(.success(result.convertToViewData()))
            } onFailure: { error in
                observer(.failure(error))
            }
        }
    }
}
