//
//  LoginUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

protocol LoginUseCase {
    func saveUserId(uid:String,completion:@escaping(Error?)->Void)
    func saveToken(token:String,completion:@escaping(Error?)->Void)
}
