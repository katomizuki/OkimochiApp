//
//  RegisterUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

protocol RegisterUseCase {
    func sendUser(user:User,completion:@escaping(Error?)->Void)
}
