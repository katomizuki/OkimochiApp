//
//  LetterDetailPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

final class LetterDetailPresentar: LetterDetailPresentable {

    struct DI {
        var router: LetterDetailWireframe
        var interactor: LetterDetailUseCase
        var view: LetterDetailViewable
    }
    weak var view: LetterDetailViewable!
    var interactor: LetterDetailUseCase!
    var router: LetterDetailWireframe!
    init(DI: DI) {
        self.view = DI.view
        self.interactor = DI.interactor
        self.router = DI.router
    }
    func viewDidLoad() {

    }

    func viewWillAppear() {

    }

    func onTapAddFavoriteButton() {

    }
}
