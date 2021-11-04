import Foundation
import UIKit
import FirebaseStorage
struct StorageServie {
    
    static func uploadImage(image: UIImage,completion:@escaping(String)->Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)")
        ref.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print(error)
                return
            }
            ref.downloadURL { url, erorr in
                if let erorr = erorr {
                    print(erorr)
                    return
                }
                guard  let urlString = url?.absoluteString else { return }
                completion(urlString)
            }
        }
    }
}
