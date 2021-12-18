//
//  UpdateProfilePresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Foundation

final class UpdateProfilePresentar:UpdateProfilePresentable {
    
    struct DI {
        var router:UpdateProfileWireframe
        var view:UpdateProfileViewable
        var interactor:UpdateProfileUserCase
    }
    var router:UpdateProfileWireframe!
    var interactor:UpdateProfileUserCase!
    weak var view:UpdateProfileViewable!
    init(DI:DI) {
        self.view = DI.view
        self.interactor = DI.interactor
        self.router = DI.router
    }
    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        
    }
    
    func onTapSaveButton() {
        
    }
    func onTapDismissButton() {
        router.dismiss()
    }
    
}
