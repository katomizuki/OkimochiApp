//
//  FinishLetterRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import Foundation
final class FinishLetterRouter: FinishLetterWireframe {
    private (set) weak var view: FinishLetterViewable!
    init(view: FinishLetterViewable) {
        self.view = view
    }
    func transitionRoot() {
        view.navigationController?.popToRootViewController(animated: true)
    }
}
