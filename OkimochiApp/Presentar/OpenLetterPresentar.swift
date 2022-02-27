//
//  OpenLetterPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

final class OpenLetterPresentar: OpenLetterPresentable {

    struct DI {
        var view: OpenLetterViewable
        var router: OpenLetterWireframe
        var interactor: OpenLetterUseCase
    }
    private weak var view: OpenLetterViewable!
    private var router: OpenLetterWireframe
    private var interactor: OpenLetterUseCase
    init(DI: DI) {
        self.view = DI.view
        self.router = DI.router
        self.interactor = DI.interactor
    }

    func onTapBlockButton() {

    }

    func viewDidLoad() {

    }
}
