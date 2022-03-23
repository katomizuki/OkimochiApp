//
//  FriendDetailUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Combine

protocol FriendDetailUseCase {
    func getUserDetail(userId: String) -> Future<User, Error>
    func applyFriend(token: String, id: String) -> Future<CompletableEntity, Error>
    func rejectFriend(token: String, id: String) -> Future<CompletableEntity, Error>
    func blockFriend(token: String, id: String) -> Future<CompletableEntity, Error>
}
