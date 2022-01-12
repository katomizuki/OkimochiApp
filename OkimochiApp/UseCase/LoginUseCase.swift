//
//  LoginUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

protocol LoginUseCase {
    func saveUserId(uid:String) async throws -> Void
    func saveToken(token:String) async throws -> Void
}
