import Foundation
import UIKit
import FirebaseAuth
struct User {
    var name: String
    var email: String
    var profileUrl:URL?
    var uid: String
    var haveLetters = [Letter]()
    var isCurrentUser:Bool {
        return Auth.auth().currentUser?.uid == uid
    }
    var isReadyMatch = false
    var isFriend = false
    init(dic: [String:Any]) {
        self.uid = dic["uid"] as? String ?? ""
        self.email = dic["email"] as? String ?? ""
        self.name = dic["name"] as? String ?? ""
        if let urlString = dic["profileImage"] as? String {
            if let url = URL(string: urlString) {
            self.profileUrl = url
            }
        }
    }
}
