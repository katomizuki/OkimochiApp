//
//  RegisterUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//
import RxSwift
protocol RegisterUseCase {
    func sendUser(credential:Credential) -> Single<AuthResponse>
    func saveToken(token: String)
}
