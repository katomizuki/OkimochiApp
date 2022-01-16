//
//  LoginUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

protocol LoginUseCase {
    func saveToken(token:String)
    func login(email:String,
               password:String,
               completion: @escaping(Result<AuthResponse, Error>) -> Void)
}
