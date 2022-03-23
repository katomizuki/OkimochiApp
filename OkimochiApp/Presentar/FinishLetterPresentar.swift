//
//  FinishLetterPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import Combine

final class FinishLetterPresentar: FinishLetterPresentable {

    struct DI {
        var view: FinishLetterViewable
        var router: FinishLetterWireframe
        var interactor: FinishLetterUseCase
    }
    weak var view: FinishLetterViewable!
    var router: FinishLetterWireframe
    var interactor: FinishLetterUseCase

    init(DI: DI) {
        self.view = DI.view
        self.interactor = DI.interactor
        self.router = DI.router
    }

    func onTapFinishButton() {
        router.transitionRoot()
        guard let token = UserDefaultsRepositry.shared.getToken() else { return }
        let dic = self.makeDic()
        _ = interactor.postLetter(dic: dic, token: token)
            .sink { [weak self] completion in
                switch completion {
                case .finished: self?.view.showSuccess()
                case .failure: self?.view.showError()
                }
            } receiveValue: { _ in }
    }

    private func makeDic() -> [String: Any] {
        return ["": ""]
    }
}
