//
//  FriendDetailRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/02/27.
//

import UIKit

final class FriendDetailRouter: FriendsDetailWireframe {
    private (set) weak var view: FriendsDetailViewable!
    init(view: FriendsDetailViewable) {
        self.view = view
    }
}
