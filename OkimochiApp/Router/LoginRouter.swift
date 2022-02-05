//
//  LoginRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Foundation
import UIKit
final class LoginRouter: LoginWireframe {

    private (set) weak var view: LoginViewable!
    init(view: LoginViewable) {
        self.view = view
    }
    func dismiss() {
        view.dismiss(animated: true)
    }

    func transitionRegisterVC() {
        print(#function)
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: RegisterController.id) as! RegisterController
        let router = RegisterRouter(view: vc)
        let interactor = RegisterInteractor(service: AuthService())
        let presentar = RegisterPresentar(DI: RegisterPresentar.DI(view: vc, router: router, interactor: interactor))
        vc.presentar = presentar
        view.navigationController?.pushViewController(vc, animated: true)
    }

}
