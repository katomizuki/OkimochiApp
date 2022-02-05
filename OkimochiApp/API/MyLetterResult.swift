//
//  MyLetterResutl.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/25.
//

struct MyLetterResult: Codable {
    let success: Bool
    let myPost: [LetterEntity]
    let saves: [LetterEntity]

    struct LetterEntity: Codable {
        let id: Int
        let okimochiId: Int
        let createdAt: String
        let updatedAt: String
        let okimochi: Okimochi
        private enum CodingKeys: String, CodingKey {
            case id
            case okimochiId = "okimochi_id"
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
            let isOpen: Int
            let createdAt: String
            let updatedAt: String
            private enum CodingKeys: String, CodingKey {
                case id
                case title
                case who
                case message
                case userName = "user_name"
                case userId = "user_id"
                case picName = "pic_name"
                case openTime = "open_time"
                case openPlaceName = "open_place_name"
                case openPlaceLatitude = "open_place_latitude"
                case openPlaceLongitude = "open_place_longitude"
                case isOpen = "public"
                case createdAt = "created_at"
                case updatedAt = "updated_at"
            }
        }
    }

}
