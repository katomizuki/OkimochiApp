//
//  LoginInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

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
    func login(email: String, password: String, completion: @escaping (Result<AuthResponse, Error>) -> Void) {
        service.login(email: email, password: password, completion: completion)
    }
}
