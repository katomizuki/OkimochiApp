//
//  UserProfileUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Combine

protocol UserProfileUseCase {
    func fetchUser(token: String) -> Future<ProfileHeaderViewData, Error>
    func fetchMyFriends(token: String) -> Future<UserFriendsViewData, Error>
}
