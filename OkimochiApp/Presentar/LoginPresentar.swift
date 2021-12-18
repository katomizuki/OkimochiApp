//
//  LoginPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Foundation
final class LoginPresentar:LoginPresentable{
    
    struct DI {
        var view:LoginViewable
        var router:LoginWireframe
        var interactor:LoginUseCase
    }
    weak var view:LoginViewable!
    var router:LoginWireframe!
    var interactor:LoginUseCase!
    init(DI:DI) {
        self.view = DI.view
        self.interactor = DI.interactor
        self.router = DI.router
    }
    func onTapLoginButton() {
        router.dismiss()
    }
    func onTapGotoRegisterButton() {
        print(#function)
        router.transitionRegisterVC()
    }
    
}
