import Foundation
import Alamofire
import Moya
import RxSwift
import Combine
protocol AuthServiceProtocol {
    func login(email: String, password: String) -> Future<LoginResponse, Error>
    func register(credential: Credential) -> Future<RegisterResponse, Error>
}
struct AuthService: AuthServiceProtocol {

    func login(email: String, password: String) -> Future<LoginResponse, Error> {
        let parameters: [String: Any] = [
            "email": "\(email)",
            "password": "\(password)"]
        return APIClient.shared.request(LoginTargetType.login(parameter: parameters))
    }

    func register(credential: Credential) -> Future<RegisterResponse, Error> {
        let parameters: [String: Any] = ["name": credential.name,
                                         "email": credential.email,
                                         "password": credential.password]
        return APIClient.shared.request(RegisterTargetType.register(paramas: parameters))
    }

}
