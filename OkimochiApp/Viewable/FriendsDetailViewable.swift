//
//  FriendsDetailViewable.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

protocol FriendsDetailViewable: Transitioner {
    func showError()
    func setFriendViewData(_ viewData: FreindDetailViewData)
}
