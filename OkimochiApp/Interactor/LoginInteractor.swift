//
//  LoginInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift

final class LoginInteractor: LoginUseCase {

    let service: AuthServiceProtocol
    init(service: AuthServiceProtocol) {
        self.service = service
    }
    func saveUserId(uid: String) {
        UserDefaultsRepositry.shared.saveUserDefaults(element: uid, key: "uid")
    }

    func saveToken(token: String) {
        UserDefaultsRepositry.shared.saveToken(token: token)
    }
    func login(email: String, password: String) -> Single<LoginResponse> {
        service.login(email: email, password: password)
    }
}
