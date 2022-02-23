import Foundation
import UIKit

struct User: Codable {
    var name: String
    var email: String
    var profileUrl: URL?
    var uid: String
    var haveLetters = [Letter]()
    var isReadyMatch = false
    var isFriend = false
    init(dic: [String: Any]) {
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

struct UserEntity: Codable {
    let success: Bool
    let saves: Letter
    
    struct Letter:Codable {
        let id: Int
        let okimochiId: Int
        let userId: Int
        let createdAt: String
        let updatedAt: String
        let okimochi: Okimochi

        private enum CodingKeys: String, CodingKey {
            case id
            case okimochiId = "okimochi_id"
            case userId = "user_id"
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case okimochi
        }
        
        struct Okimochi: Codable {
            let id: Int
            let who: String
            let title: String
            let message: String
            let userName: String
            let userId: Int
            let picName: String
            let openTime: String
            let openPlaceName: String
            let openPlaceLatitude: Double
            let openPlaceLongitude: Double
            let isPublic: Bool
            
            private enum CodingKeys: String ,CodingKey {
                case id
                case who
                case title
                case message
                case userName  = "user_name"
                case userId = "user_id"
                case picName = "pic_name"
                case openTime = "open_time"
                case openPlaceName = "open_place_name"
                case openPlaceLatitude = "open_place_latitude"
                case openPlaceLongitude = "open_place_longitude"
                case isPublic = "public"
            }
        }
    }
}
