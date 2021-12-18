//
//  PostLetterRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/17.
//

import Foundation
import UIKit

final class PostLetterRouter:PostLetterWireFrame {
    private (set) weak var view:PostLetterViewable!
    init(view:PostLetterViewable) {
        self.view = view
    }
    func transtionLetterContentVC() {
        let storyboard = UIStoryboard(name: "PostLetter", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LetterContentController") as! LetterContentController
//        let interactor = Letteri
        view.pushViewController(controller, animated: true)
    }
}
