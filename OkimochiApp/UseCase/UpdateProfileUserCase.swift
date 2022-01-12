//
//  UpdateProfileUserCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

protocol UpdateProfileUserCase {
    func updateUserProfile(user:User) async throws -> Void
}
