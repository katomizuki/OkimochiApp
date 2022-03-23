//
//  RegisterUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//
import Combine

protocol RegisterUseCase {
    func sendUser(credential: Credential) -> Future<RegisterResponse, Error>
    func saveToken(token: String)
}
