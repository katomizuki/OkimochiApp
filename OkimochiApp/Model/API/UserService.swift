import Foundation
import FirebaseFirestore
import Alamofire
struct UserService {
    
    static func fetchUser(uid:String,completion:@escaping(User)->Void) {
        userRef.document(uid).getDocument { snapShot, error in
            if let error = error {
                print(error)
                return
            }
            guard let dic = snapShot?.data() else { return }
            let user = User(dic: dic)
            completion(user)
        }
    }
    static func fetchUsers(completion:@escaping([User])->Void) {
        userRef.getDocuments { snapShot, error in
            if let error = error {
                print(error)
                return
            }
            guard let snapShot = snapShot else { return }
            let users = snapShot.documents.map({ User(dic: $0.data()) })
            completion(users)
        }
    }
    static func saveMatch(me:User,you:User) {
        matchRef.document(me.uid).collection("match_user").document(you.uid).setData([:])
    }
}
