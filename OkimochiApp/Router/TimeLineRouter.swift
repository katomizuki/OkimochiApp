//
//  TimeLineRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Foundation
import UIKit

final class TimeLineRouter: TimeLineWireframe {
    private (set) weak var view: TimeLineViewable!
    init(view: TimeLineViewable) {
        self.view = view
    }
    func transitionLogin() {
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: LoginController.id) as! LoginController
        let loginRouter = LoginRouter(view: controller)
        let interactor = LoginInteractor(service: AuthService())
        let presentar = LoginPresentar(DI: LoginPresentar.DI(view: controller, router: loginRouter, interactor: interactor))
        controller.presentar = presentar
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.view.present(nav, animated: true, completion: nil)
        }
    }

    func transitionLetterDetail() {
        view.performSegue(withIdentifier: OpenLetterController.id, sender: nil)
    }
    func transitionOpenLetter() {
        let storyboard = UIStoryboard(name: "MainTab", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: OpenLetterController.id) as! OpenLetterController
        let router = OpenLetterRouter(view: controller)
        let interactor = OpenLetterInteractor()
        let presentar = OpenLetterPresentar(DI: OpenLetterPresentar.DI(view: controller, router: router, interactor: interactor))
        controller.presentar = presentar
    }
}
