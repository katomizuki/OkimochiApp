//
//  RegisterInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Combine

final class RegisterInteractor: RegisterUseCase {

    let service: AuthServiceProtocol
    init(service: AuthServiceProtocol) {
        self.service = service
    }
    func sendUser(credential: Credential) -> Future<RegisterResponse, Error> {
        service.register(credential: credential)
    }
    func saveToken(token: String) {
        UserDefaultsRepositry.shared.saveToken(token: token)
    }

}
