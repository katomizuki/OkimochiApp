//
//  FriendsResult.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/26.
//

struct FriendsResult: Codable {
    let friendList:[FriendResponse]
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
        private enum CodingKeys: String, CodingKey {
            case id
            case requestId = "request_id"
            case receiveId = "receive_id"
            case status
            case createdAt = "created_at"
            case updatedAt = "updated_at"
        }
    }
}
