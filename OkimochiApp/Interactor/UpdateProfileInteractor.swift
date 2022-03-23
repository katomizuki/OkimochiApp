//
//  UpdateProfileInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Combine

final class UpdateProfileInteractor: UpdateProfileUserCase {

    let service: UserServiceProtocol
    private let disposeBag = DisposeBag()
    init(service: UserServiceProtocol) {
        self.service = service
    }
    func updateUserProfile(user: User, token: String) -> Future<CompletableEntity, Error> {
        service.updateUser(token: token)
    }
    func getUser(token: String) -> Future<UserViewData, Error> {
        return Future<UserViewData, Error> { promise in
            self.service.getUser(token: token).sink(receiveCompletion: { completed in
                switch completed {
                case .failure(let error):
                    promise(.failure(error))
                case .finished:
                    print("finish")
                }
            }, receiveValue: { user in
                promise(.success(UserViewData(user: user)))
            })
        }
    }
}
