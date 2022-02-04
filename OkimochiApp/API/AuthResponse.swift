
import Foundation

struct LoginResponse:Codable {
    
    let success:Bool
    let token:String
    let saves:LoginInfo
    
    struct LoginInfo: Codable {
        let id: Int
        let okimochiId: Int
        let userId: Int
        let createdAt: String
        let updatedAt: String
        let okimochi: [Okimochi]
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
            let openPlaceLogitude: Double
            let isPublic: Int
            let createdAt: String
            let updatedAt: String
            
            private enum CodingKeys: String, CodingKey {
                case id
                case who
                case title
                case message
                case userName = "user_name"
                case userId = "user_id"
                case picName = "pic_name"
                case openTime = "open_time"
                case openPlaceName = "open_place_name"
                case openPlaceLatitude = "open_place_latitude"
                case openPlaceLogitude = "open_place_longitude"
                case isPublic = "public"
                case createdAt = "created_at"
                case updatedAt = "updated_at"
            }
        }
    }
}


struct RegisterResponse: Codable {
    let success: Bool
    let message: String
    let data: UserInfo
    let token: String
    struct UserInfo: Codable {
        let name: String
        let email: String
        let updatedAt: String
        let createdAt: String
        let id: Int
        
        private enum CodingKeys: String, CodingKey {
            case name
            case email
            case updatedAt = "updated_at"
            case createdAt = "created_at"
            case id
        }
    }
}
