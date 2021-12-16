//
//  SearchFriendPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Foundation

final class SearchFriendPresentar:SearchFriendPresentable {
    struct DI {
        var router:SearchFriendsWireframe
        var view: SearchFriendsViewable
        var interactor:SearchFriendUseCase
    }
    weak var view:SearchFriendsViewable!
    var interactor:SearchFriendUseCase!
    var router:SearchFriendsWireframe!
    init(DI:DI) {
        self.view = DI.view
        self.interactor = DI.interactor
        self.router = DI.router
    }
}
