//
//  SearchFriendUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift
protocol SearchFriendUseCase {
    func searchUser(text:String, token: String) -> Single<[User]>
    func requestFriend(token: String,id: String) -> Completable
}
