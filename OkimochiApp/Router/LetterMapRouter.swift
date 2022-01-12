//
//  LetterMapRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import Foundation
import UIKit
final class LetterMapRouter:LetterMapWireframe {
    private (set) weak var view: LetterMapViewable!
    init(view:LetterMapViewable) {
        self.view = view
    }
    func transitionLetterLastVC() {
        let storyboard = UIStoryboard(name: "PostLetter", bundle: nil)
        guard let controller = storyboard.instantiateViewController(withIdentifier: FinishLetterController.id) as? FinishLetterController else { return }
        let router = FinishLetterRouter(view: controller)
        let interactor = FinishLetterInteractor(service: PostService())
        let presentar = FinishLetterPresentar(DI: FinishLetterPresentar.DI(view: controller, router: router, interactor: interactor))
        controller.presentar = presentar
        view.navigationController?.pushViewController(controller, animated: true)
    }
}
