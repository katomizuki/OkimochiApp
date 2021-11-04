import Foundation
import FirebaseAuth
import FirebaseStorage
struct Credential {
    var email:String
    var name:String
    var password:String
    var profileImage:UIImage
}


struct AuthService {
    static func register(credential:Credential,completion:@escaping(Error?)->Void) {
        StorageServie.uploadImage(image: credential.profileImage) { urlString in
            Auth.auth().createUser(withEmail: credential.email, password: credential.email) { result, error in
                if let error = error {
                    print(error)
                    return
                }
                guard let uid = result?.user.uid else { return }
                let dic = ["email":credential.email,
                           "name":credential.name,
                           "password":credential.password,
                           "profileImage":urlString]
                userRef.document(uid).setData(dic,completion: completion)
            }
        }
    }
    static func login(email:String,password:String,completion:AuthDataResultCallback?) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
}
