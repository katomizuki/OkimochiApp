//
//  UserProfilePresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Foundation

final class UserProfilePresentar: UserProfilePresentable {
   
    
    struct DI {
        var router:UserProfileWireframe
        var interactor:UserProfileUseCase
        var view:UserProfileViewable
    }
    weak var view:UserProfileViewable!
    var interactor:UserProfileUseCase!
    var router:UserProfileWireframe!
    init(DI:DI) {
        self.router = DI.router
        self.interactor = DI.interactor
        self.view = DI.view
    }
    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        
    }
    
    func onTapUpdateButton() {
        
    }
    
    func onTapPastButton() {
        
    }
    
    func onTapFriendsButton() {
        
    }
}
