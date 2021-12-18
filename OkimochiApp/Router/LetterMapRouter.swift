//
//  LetterMapRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import Foundation

final class LetterMapRouter {
    private (set) weak var view: LetterMapViewable!
    init(view:LetterMapViewable) {
        self.view = view
    }
}
