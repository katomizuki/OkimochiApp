import Foundation
import FirebaseFirestore
struct UserService {
    
    static func fetchUser(uid:String,completion:@escaping(User)->Void) {
        userRef.document(uid).getDocument { snapShot, error in
            if let error = error {
                print(error)
                return
            }
            guard let dic = snapShot?.data() else { return }
            let user = User(uid: uid, dic: dic)
            completion(user)
        }
    }
}
