//
//  UserProfileInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Combine

final class UserProfileInteractor: UserProfileUseCase {

    let service: UserServiceProtocol
    let postService: PostServiceProtocol

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

    func fetchMyFriends(token: String) -> Future<UserFriendsViewData, Error> {
        return Future<UserFriendsViewData, Error> { promise in
            self.service.getFriends(token: token).sink { completion in
                switch completion {
                case .failure(let error): promise(.failure(error))
                case .finished: print("finish")
                }
            } receiveValue: { result in
                promise(.success(UserFriendsViewData(result: result)))
            }
        }
    }
}
