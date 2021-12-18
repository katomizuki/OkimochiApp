//
//  LetterContentPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import Foundation

final class LetterContentPresentar:LetterContentPresentable {
    
    struct DI {
        var view:LetterContentViewable
        var router:LetterContentRouter
        var interactor:LetterContentUseCase
    }
    weak var view:LetterContentViewable!
    var router:LetterContentRouter!
    var interactor:LetterContentUseCase!
    init(DI:DI) {
        self.view = DI.view
        self.router = DI.router
        self.interactor = DI.interactor
    }
    func viewDidLoad() {
        
    }
}
