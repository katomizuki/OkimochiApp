//
//  RequestFriendsTargetType.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/26.
//

struct RequestFriends:Codable {
    let success: Bool
    let message: String
    let data: RequestData
    struct RequestData: Codable {
        let requestId: Int
        let receiveId: String
        let status: Int
        let updatedAt: String
        let createdAt: String
        let id: Int
        
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

