//
//  LetterFriendUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import RxSwift
import Combine
protocol LetterFriendUseCase {
    func fetchFriends(uid: String, token: String) -> Future<UserFriendsViewData, Error>
}
