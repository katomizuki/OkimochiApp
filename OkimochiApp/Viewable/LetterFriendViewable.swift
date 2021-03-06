//
//  LetterFriendViewable.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

protocol LetterFriendViewable: Transitioner {
    func showError()
    func setFriends(_ viewData: LetterFriendsViewData)
}
