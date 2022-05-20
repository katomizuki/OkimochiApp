//
//  LetterContentPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

final class LetterContentPresentar: LetterContentPresentable {

    struct DI {
        let view: LetterContentViewable
        let router: LetterContentWireframe
        let interactor: LetterContentUseCase
    }
    weak var view: LetterContentViewable!
    let router: LetterContentWireframe
    let interactor: LetterContentUseCase

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
