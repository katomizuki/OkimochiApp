//
//  LetterContentRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

final class LetterContentRouter:LetterContentWireframe {
    private (set) weak var view:LetterContentViewable!
    init(view:LetterContentViewable) {
        self.view = view
    }
}
