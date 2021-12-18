//
//  LetterTimePresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import Foundation

final class LetterTimePresentar:LetterTimePresentable {
    struct DI {
        var view:LetterTimeViewable
        var router:LetterTimeWireframe
        var interactor:LetterTimeUseCase
    }
    weak var view:LetterTimeViewable!
    var router: LetterTimeWireframe!
    var interactor:LetterTimeUseCase
    init(DI:DI) {
        self.view = DI.view
        self.interactor = DI.interactor
        self.router = DI.router
    }
}
