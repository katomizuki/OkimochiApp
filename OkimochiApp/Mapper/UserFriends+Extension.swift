//
//  UserFriends+Extension.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/26.
//

extension FriendsResult {
    func convertToViewData() -> UserFriendsViewData {
        return UserFriendsViewData(result: self)
    }
}
