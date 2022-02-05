//
//  LetterFriendRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import Foundation

final class LetterFriendRouter: LetterFriendWireframe {
    private (set) weak var view: LetterFriendViewable?
    init(view: LetterFriendViewable) {
        self.view = view
    }
}
