//
//  RegisterPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift

final class RegisterPresentar:RegisterPresentable {
    
    struct DI {
        var view:RegisterViewable
        var router:RegisterWireframe
        var interactor:RegisterUseCase
    }
    weak var view:RegisterViewable!
    var router:RegisterWireframe!
    var interactor:RegisterUseCase!
    private let disposeBag = DisposeBag()
    init(DI:DI) {
        self.router = DI.router
        self.view = DI.view
        self.interactor = DI.interactor
    }
    
    func onTapGotoLoginButton() {
        router.transitionLoginVC()
    }
    func onTapRegisterButton(credential: Credential) {
        self.interactor.sendUser(credential: credential)
            .subscribe { response in
                print(response,"⚡️")
//            self.view.dismiss(animated: true)
        } onFailure: { error in
            self.view.showError()
        }.disposed(by: disposeBag)

        
    }
    
    
}
