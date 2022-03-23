//
//  LoginPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Combine

final class LoginPresentar: LoginPresentable {

    struct DI {
        var view: LoginViewable
        var router: LoginWireframe
        var interactor: LoginUseCase
    }
    weak var view: LoginViewable!
    var router: LoginWireframe!
    var interactor: LoginUseCase!

    init(DI: DI) {
        self.view = DI.view
        self.interactor = DI.interactor
        self.router = DI.router
    }

    func onTapLoginButton(email: String, password: String) {
        _ = interactor.login(email: email, password: password)
            .sink { [weak self] completion in
                switch completion {
                case .failure: self?.view.showError()
                case .finished: print("finish")
                }
            } receiveValue: { [weak self] response in
                self?.interactor.saveToken(token: response.token)
            }
    }
    func onTapGotoRegisterButton() {
        router.transitionRegisterVC()
    }

}
