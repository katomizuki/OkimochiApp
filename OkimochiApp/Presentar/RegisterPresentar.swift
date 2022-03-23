//
//  RegisterPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Combine

final class RegisterPresentar: RegisterPresentable {

    struct DI {
        var view: RegisterViewable
        var router: RegisterWireframe
        var interactor: RegisterUseCase
    }
    weak var view: RegisterViewable!
    var router: RegisterWireframe!
    var interactor: RegisterUseCase!

    init(DI: DI) {
        self.router = DI.router
        self.view = DI.view
        self.interactor = DI.interactor
    }

    func onTapGotoLoginButton() {
        router.transitionLoginVC()
    }
    func onTapRegisterButton(credential: Credential) {
        _ = interactor.sendUser(credential: credential)
            .sink { [weak self] completion in
                switch completion {
                case .finished: print("finish")
                case .failure: self?.view.showError()
                }
            } receiveValue: { [weak self] response in
                self?.interactor.saveToken(token: response.token)
                self?.view.dismiss(animated: true)
            }
    }

}
