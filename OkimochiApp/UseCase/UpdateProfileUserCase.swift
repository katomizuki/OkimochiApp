//
//  UpdateProfileUserCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//
import RxSwift
import Combine
protocol UpdateProfileUserCase {
    func updateUserProfile(user: User, token: String) -> Completable
    func getUser(token: String) -> Future<UserViewData, Error>
}
