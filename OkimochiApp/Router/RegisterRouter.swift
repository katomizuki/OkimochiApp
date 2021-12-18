//
//  RegisterRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Foundation

final class RegisterRouter: RegisterWireframe {
    private (set) weak var view:RegisterViewable!
    init(view:RegisterViewable) {
        self.view = view
    }
    func dismiss() {
        view.dismiss(animated: true)
    }
    func transitionLoginVC() {
        view.popViewController(animated: true)
    }
}
