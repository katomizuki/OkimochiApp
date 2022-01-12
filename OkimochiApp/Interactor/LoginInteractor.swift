//
//  LoginInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

final class LoginInteractor: LoginUseCase {
   
    
    let service:AuthServiceProtocol
    init(service:AuthServiceProtocol) {
        self.service = service
    }
    func saveUserId(uid: String) async throws {
        
    }
    
    func saveToken(token: String) async throws {
        
    }
}
