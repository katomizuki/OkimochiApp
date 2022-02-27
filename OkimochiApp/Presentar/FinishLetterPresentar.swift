//
//  FinishLetterPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import RxSwift

final class FinishLetterPresentar: FinishLetterPresentable {

    struct DI {
        var view: FinishLetterViewable
        var router: FinishLetterWireframe
        var interactor: FinishLetterUseCase
    }
    weak var view: FinishLetterViewable!
    var router: FinishLetterWireframe
    var interactor: FinishLetterUseCase
    private let disposeBag = DisposeBag()
    init(DI: DI) {
        self.view = DI.view
        self.interactor = DI.interactor
        self.router = DI.router
    }

    func onTapFinishButton() {
        router.transitionRoot()
        guard let token = UserDefaultsRepositry.shared.getToken() else { return }
        let dic = self.makeDic()
        interactor.postLetter(dic: dic, token: token).subscribe { [weak self] in
            self?.view.showSuccess()
        } onError: { [weak self] _ in
            self?.view.showError()
        }.disposed(by: disposeBag)

    }

    private func makeDic() -> [String: Any] {
        return ["": ""]
    }
}
