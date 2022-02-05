//
//  OpenLetterRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

final class OpenLetterRouter: OpenLetterWireframe {
    private (set) weak var view: OpenLetterViewable!
    init(view: OpenLetterViewable) {
        self.view = view
    }
}
