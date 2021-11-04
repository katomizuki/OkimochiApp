import Foundation
import UIKit
protocol AuthProtocol {
    var isValid:Bool { get }
}
struct RegisterViewModel: AuthProtocol {
    var email: String?
    var name: String?
    var password: String?
    var image:UIImage?
    var isValid: Bool {
        return email?.count ?? 0 >= 6 && password?.count ?? 0 >= 6 && !(name?.isEmpty ?? true)
    }
}
