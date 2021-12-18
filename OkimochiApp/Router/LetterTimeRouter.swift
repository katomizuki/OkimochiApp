//
//  LetterTimeRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import Foundation
import UIKit

final class LetterTimeRouter:LetterTimeWireframe {
    private (set) weak var view:LetterTimeViewable!
    init(view:LetterTimeViewable) {
        self.view = view
    }
    func transitionLetterMapVC() {
        let storyboard = UIStoryboard(name: "PostLetter", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: LetterMapController.id) as! LetterMapController
        let router = LetterMapRouter(view: controller)
        let interactor = LetterMapInteractor()
        let presentar = LetterMapPresentar(DI: LetterMapPresentar.DI(view: controller, router: router, interactor: interactor))
        controller.presentar = presentar
        view.navigationController?.pushViewController(controller, animated: true)
    }
}
