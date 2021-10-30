import Foundation

struct LoginViewModel:AuthProtocol {
    var email: String
    var password: String
    var isValid: Bool {
        return email.count >= 6 && password.count >= 6
    }
}


