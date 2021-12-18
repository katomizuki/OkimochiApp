//
//  PostLetterPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/17.
//

import Foundation
import UIKit

final class PostLetterPresentar:PostLetterPresentable {
   
    struct DI {
        var view:PostLetterViewable
        var interactor:PostLetterUseCase
        var router:PostLetterWireFrame
    }
    weak var view:PostLetterViewable!
    var interactor:PostLetterUseCase!
    var router:PostLetterWireFrame!
    init(DI:DI) {
        self.view = DI.view
        self.router = DI.router
        self.interactor = DI.interactor
    }
    func viewDidLoad() {
        
    }
    
    func onTapNextButton() {
        router.transtionLetterContentVC()
    }
    func onTapFriendButton() {
        router.transtionLetterFriendVC()
    }
    
}
