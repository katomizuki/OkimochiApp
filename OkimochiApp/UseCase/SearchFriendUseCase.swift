//
//  SearchFriendUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Combine
protocol SearchFriendUseCase {
    func searchUser(text: String, token: String) -> Future<[User], Error>
    func requestFriend(token: String, id: String) -> Future<CompletableEntity, Error>
}
