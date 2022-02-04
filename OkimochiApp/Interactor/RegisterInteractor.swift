//
//  RegisterInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift

final class RegisterInteractor: RegisterUseCase {
    
    let service: AuthServiceProtocol
    init(service: AuthServiceProtocol) {
        self.service = service
    }
    func sendUser(credential:Credential) -> Single<RegisterResponse> {
        service.register(credential: credential)
    }
    func saveToken(token: String) {
        UserDefaultsRepositry.shared.saveToken(token: token)
    }
   
}
