//
//  LetterDetailRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Foundation

final class LetterDetailRouter: LetterDetailWireframe {
    private (set) weak var view: LetterDetailViewable!
    init(view: LetterDetailViewable) {
        self.view = view
    }
    func dismiss() {
        view.dismiss(animated: true)
    }
}
