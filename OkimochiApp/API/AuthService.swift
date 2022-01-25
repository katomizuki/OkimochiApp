import Foundation
import Alamofire
import Moya
import RxSwift

protocol AuthServiceProtocol {
    func login(email: String,password: String) -> Single<AuthResponse>
    func register(credential: Credential) -> Single<AuthResponse>
}
struct AuthService: AuthServiceProtocol {
    
    func login(email: String, password: String) -> Single<AuthResponse> {
        let parameters:[String:Any] = [
            "email" : "\(email)",
            "password" : "\(password)"]
        return APIClient.shared.request(AuthAPI.login(parameter: parameters))
    }

    func register(credential:Credential)->Single<AuthResponse> {
        let parameters:[String:Any] = ["name" : credential.name,
                                       "email" : credential.email,
                                       "password" : credential.password]
        return APIClient.shared.request(AuthAPI.register(parameter: parameters))
    }
    
}

