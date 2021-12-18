//
//  TimeLineRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Foundation

final class TimeLineRouter:TimeLineWireframe {
    private (set) weak var view:TimeLineViewable!
    init(view:TimeLineViewable) {
        self.view = view
    }
    func transitionLogin() {
        print(#function)
        DispatchQueue.main.async {
            self.view.performSegue(withIdentifier: "LoginController", sender: nil)
        }
        
    }
    
    func transitionLetterDetail() {
        DispatchQueue.main.async {
            self.view.performSegue(withIdentifier:"OpenLetterController", sender: nil)
        }
    }
}
