//
//  LetterMapPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import Foundation
final class LetterMapPresentar: LetterMapPresentable {
    struct DI {
        var view:LetterMapViewable
        var router:LetterMapWireframe
        var interactor:LetterMapUseCase
    }
    weak var view:LetterMapViewable!
    var router:LetterMapWireframe
    var interactor:LetterMapUseCase
    init(DI:DI) {
        self.view = DI.view
        self.router = DI.router
        self.interactor = DI.interactor
    }
    func viewDidLoad() {
        
    }
}
