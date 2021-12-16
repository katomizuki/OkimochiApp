import Foundation

struct LoginViewData: AuthProtocol {
    var email: String?
    var password: String?
    var isValid: Bool {
        return email?.count ?? 0 >= 6 && password?.count ?? 0 >= 6
    }
}


