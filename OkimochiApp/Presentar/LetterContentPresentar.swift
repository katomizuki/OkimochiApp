//
//  LetterContentPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

final class LetterContentPresentar: LetterContentPresentable {

    struct DI {
        var view: LetterContentViewable
        var router: LetterContentWireframe
        var interactor: LetterContentUseCase
    }
    weak var view: LetterContentViewable!
    var router: LetterContentWireframe!
    var interactor: LetterContentUseCase!

    init(DI: DI) {
        self.view = DI.view
        self.router = DI.router
        self.interactor = DI.interactor
    }
    func viewDidLoad() {

    }
    func onTapNextButton() {
        router.transitionLetterTimeVC()
    }
}
