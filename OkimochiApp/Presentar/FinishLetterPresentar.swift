//
//  FinishLetterPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//


final class FinishLetterPresentar:FinishLetterPresentable {
    
    struct DI {
        var view:FinishLetterViewable
        var router:FinishLetterWireframe
        var interactor:FinishLetterUseCase
    }
    weak var view:FinishLetterViewable!
    var router:FinishLetterWireframe
    var interactor:FinishLetterUseCase
    init(DI:DI) {
        self.view = DI.view
        self.interactor = DI.interactor
        self.router = DI.router
    }
    func onTapFinishButton() {
//        interactor.sendLetter(, completion: )
        router.transitionRoot()
    }
}
