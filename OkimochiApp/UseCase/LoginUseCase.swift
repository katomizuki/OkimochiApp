//
//  LoginUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//
import Combine
protocol LoginUseCase {
    func saveToken(token: String)
    func login(email: String, password: String) -> Future<LoginResponse, Error>
}
