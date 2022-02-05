//
//  LetterContentRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//
import UIKit
final class LetterContentRouter: LetterContentWireframe {

    private (set) weak var view: LetterContentViewable!
    init(view: LetterContentViewable) {
        self.view = view
    }
    func transitionLetterTimeVC() {
        let storyboard = UIStoryboard(name: "PostLetter", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: LetterTimeController.id) as! LetterTimeController
        let router = LetterTimeRouter(view: controller)
        let interactor = LetterTimeInteractor()
        let presentar = LetterTimePresentar(DI: LetterTimePresentar.DI(view: controller, router: router, interactor: interactor))
        controller.presentar = presentar
        view.navigationController?.pushViewController(controller, animated: true)
    }

}
