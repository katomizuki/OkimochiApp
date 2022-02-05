//
//  LoginUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//
import RxSwift
protocol LoginUseCase {
    func saveToken(token: String)
    func login(email: String, password: String) -> Single<LoginResponse>
}
