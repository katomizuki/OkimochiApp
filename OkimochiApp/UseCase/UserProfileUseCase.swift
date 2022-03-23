//
//  UserProfileUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//
import RxSwift
import Combine

protocol UserProfileUseCase {
    func fetchUser(token: String) -> Future<ProfileHeaderViewData, Error>
    //    func fetchMyLetter(token: String)->Single<UserLetterViewData>
    func fetchMyFriends(token: String) -> Future<UserFriendsViewData, Error>
}
