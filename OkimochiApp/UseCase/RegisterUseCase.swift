//
//  RegisterUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

protocol RegisterUseCase {
    func sendUser(_ credential:Credential,completion: @escaping (Result<Void,Error>)->Void)
    func saveToken(token: String)
}
