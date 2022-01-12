//
//  RegisterInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

final class RegisterInteractor: RegisterUseCase {
    
    
    let service:AuthServiceProtocol
    init(service:AuthServiceProtocol) {
        self.service = service
    }

    func sendUser(user: User) async throws {
        
    }
    
   
}
