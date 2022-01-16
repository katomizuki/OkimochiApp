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
    func sendUser(_ credential: Credential, completion: @escaping (Result<Void, Error>) -> Void) {
        service.register(credential: credential, completion: completion)
    }
    func saveToken(token: String) {
        UserDefaultsRepositry.shared.saveToken(token: token)
    }
   
}
