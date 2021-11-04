import Foundation
import UIKit
struct User {
    var name: String
    var email: String
    var profileUrl:URL?
    var uid: String
    var haveLetters = [Letter]()
    init(uid: String,dic: [String:Any]) {
        self.uid = uid
        self.email = dic["email"] as? String ?? ""
        self.name = dic["name"] as? String ?? ""
        if let urlString = dic["profileImage"] as? String {
            if let url = URL(string: urlString) {
            self.profileUrl = url
            }
        }
    }
}
