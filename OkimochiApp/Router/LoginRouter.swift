//
//  LoginRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Foundation

final class LoginRouter:LoginWireframe {
    private (set) weak var view:LoginViewable!
    init(view:LoginViewable) {
        self.view = view
    }
    func dismiss() {
        
    }
}
