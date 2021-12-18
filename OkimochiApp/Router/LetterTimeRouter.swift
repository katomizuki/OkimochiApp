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
}
