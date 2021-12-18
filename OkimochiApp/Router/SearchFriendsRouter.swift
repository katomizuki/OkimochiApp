//
//  SearchFriendsRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Foundation

final class SearchFriendsRouter: SearchFriendsWireframe {
    private (set) weak var view:SearchFriendsViewable!
    init(view:SearchFriendsViewable) {
        self.view = view
    }
    func transitionDetail() {
        
    }
}
