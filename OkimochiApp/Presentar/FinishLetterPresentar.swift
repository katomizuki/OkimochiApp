//
//  FinishLetterPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import RxSwift


final class FinishLetterPresentar:FinishLetterPresentable {
    
    struct DI {
        var view:FinishLetterViewable
        var router:FinishLetterWireframe
        var interactor:FinishLetterUseCase
    }
    weak var view:FinishLetterViewable!
    var router:FinishLetterWireframe
    var interactor:FinishLetterUseCase
    private let disposeBag = DisposeBag()
    init(DI:DI) {
        self.view = DI.view
        self.interactor = DI.interactor
        self.router = DI.router
    }
    func onTapFinishButton() {
        guard let token = UserDefaultsRepositry.shared.getToken() else { return }
        interactor.postLetter(dic: ["":""], token: token).subscribe {
            self.view.showSuccess()
        } onError: { [weak self] _ in
            self?.view.showError()
        }.disposed(by: disposeBag)

        router.transitionRoot()
    }
}
