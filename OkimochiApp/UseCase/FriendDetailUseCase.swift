//
//  FriendDetailUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift

protocol FriendDetailUseCase {
    func getUserDetail(userId: String)->Single<User>
    func applyFriend(token: String, id: String) -> Completable
    func rejectFriend(token: String, id: String) -> Completable
    func blockFriend(token: String, id: String) -> Completable
}
