//
//  UpdateProfileUserCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Combine
protocol UpdateProfileUserCase {
    func updateUserProfile(user: User, token: String) -> Future<CompletableEntity, Error>
    func getUser(token: String) -> Future<UserViewData, Error>
}
