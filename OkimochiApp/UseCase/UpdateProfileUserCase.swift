//
//  UpdateProfileUserCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//
import RxSwift
protocol UpdateProfileUserCase {
    func updateUserProfile(user: User, token: String) -> Completable
    func getUser(token: String) -> Single<UserViewData>
}
