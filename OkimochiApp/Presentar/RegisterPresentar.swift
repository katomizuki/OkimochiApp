//
//  RegisterPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Foundation
final class RegisterPresentar:RegisterPrentable {
    
    struct DI {
        var view:RegisterViewable
        var router:RegisterWireframe
        var interactor:RegisterUseCase
    }
    weak var view:RegisterViewable!
    var router:RegisterWireframe!
    var interactor:RegisterUseCase!
    init(DI:DI) {
        self.router = DI.router
        self.view = DI.view
        self.interactor = DI.interactor
    }
    func onTapRegisterButton() {
        
    }
    
}
