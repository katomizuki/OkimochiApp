//
//  FriendsResult.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/26.
//

struct FriendsResult: Codable {
    let friendList: [FriendResponse]
    private enum CodingKeys: String, CodingKey {
        case friendList = "friends_list"
    }
    struct FriendResponse: Codable {
        let id: Int
        let requestId: Int
        let receiveId: Int
        let status: Int
        let createdAt: String
        let updatedAt: String
        let receiveUser: Friend

        private enum CodingKeys: String, CodingKey {
            case id
            case requestId = "request_id"
            case receiveId = "receive_id"
            case status
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case receiveUser = "receive_user"
        }

        struct Friend: Codable {
            let id: Int
            let name: String
            let email: String
            let picName: String
            let emailVeriedAt: String
            let createdAt: String
            let updatedAt: String
            
            private enum CodingKeys: String, CodingKey {
                case id
                case name
                case email
                case picName = "pic_name"
                case emailVeriedAt = "email_verified_at"
                case createdAt = "created_at"
                case updatedAt = "updated_at"
            }
        }
    }
}
