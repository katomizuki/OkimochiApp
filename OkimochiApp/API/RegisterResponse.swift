
import Foundation

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
