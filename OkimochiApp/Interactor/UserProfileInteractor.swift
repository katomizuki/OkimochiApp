//
//  UserProfileInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift
import Combine

final class UserProfileInteractor: UserProfileUseCase {

    let service: UserServiceProtocol
    let postService: PostServiceProtocol
    private let disposeBag = DisposeBag()
    init(service: UserServiceProtocol, postService: PostServiceProtocol) {
        self.service = service
        self.postService = postService
    }

    func fetchUser(token: String) -> Future<ProfileHeaderViewData, Error> {
        return Future<ProfileHeaderViewData, Error> { promise in
            self.service.getUser(token: token).sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("finish")
                case .failure(let error):
                    promise(.failure(error))
                }
            }, receiveValue: { user in
                promise(.success(ProfileHeaderViewData(user: user)))
            })
        }
    }

    func fetchMyFriends(token: String) -> Single<UserFriendsViewData> {
        return Single.create { observer -> Disposable in
            self.service.getFriends(token: token).subscribe { result in
                observer(.success(UserFriendsViewData(result: result)))
            } onFailure: { error in
                observer(.failure(error))
            }
        }
    }
}
