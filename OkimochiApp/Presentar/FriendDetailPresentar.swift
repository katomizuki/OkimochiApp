//
//  FriendDetailPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Foundation

final class FriendDetailPresentar:FriendDetailPresentable {
    
    
    struct DI {
        var view:FriendsDetailViewable
        var interactor:FriendDetailUseCase
        var router:FriendsDetailWireframe
    }
    weak var view:FriendsDetailViewable!
    var interactor:FriendDetailUseCase!
    var router:FriendsDetailWireframe!
    init(DI:DI) {
        self.view = DI.view
        self.router = DI.router
        self.interactor = DI.interactor
    }
    func onApplyFriendButton() {
        
    }
    func viewDidLoad() {
        
    }
}
