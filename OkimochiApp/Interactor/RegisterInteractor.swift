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
    func sendUser(_ credential: Credential, completion: @escaping (Error?) -> Void) {
        service.register(credential: credential) { result in
            switch result {
            case .success(let authReponse):
                print(authReponse)
                self.saveToken(token: authReponse.token)
            case .failure(let error):
                completion(error)
            }
        }
    }
    func saveToken(token: String) {
        UserDefaultsRepositry.shared.saveToken(token: token)
    }
   
}
