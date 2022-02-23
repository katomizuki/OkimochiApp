//
//  LoginPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift
final class LoginPresentar: LoginPresentable {

    struct DI {
        var view: LoginViewable
        var router: LoginWireframe
        var interactor: LoginUseCase
    }
    weak var view: LoginViewable!
    var router: LoginWireframe!
    var interactor: LoginUseCase!
    private let disposeBag = DisposeBag()
    init(DI: DI) {
        self.view = DI.view
        self.interactor = DI.interactor
        self.router = DI.router
    }

    func onTapLoginButton(email: String, password: String) {
        interactor.login(email: email, password: password).subscribe { response in
            self.interactor.saveToken(token: response.token)
            self.view.showError()
        } onFailure: { _ in
            self.view.showError()
        }.disposed(by: disposeBag)

    }
    func onTapGotoRegisterButton() {
        router.transitionRegisterVC()
    }

}
