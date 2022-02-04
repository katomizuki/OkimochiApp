//
//  UpdateProfilePresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift
final class UpdateProfilePresentar: UpdateProfilePresentable {
    
    struct DI {
        var router:UpdateProfileWireframe
        var view:UpdateProfileViewable
        var interactor:UpdateProfileUserCase
    }
    var router:UpdateProfileWireframe!
    var interactor:UpdateProfileUserCase!
    weak var view:UpdateProfileViewable!
    private let disposeBag = DisposeBag()
    init(DI:DI) {
        self.view = DI.view
        self.interactor = DI.interactor
        self.router = DI.router
    }
    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        guard let token = UserDefaultsRepositry.shared.getToken() else { return }
        interactor.getUser(token: token)
            .observe(on: MainScheduler.instance)
            .subscribe { [weak self] viewData in
                self?.view.setViewData(viewData)
            } onFailure: { [weak self] _ in
                self?.view.showError()
            }.disposed(by: disposeBag)

    }
    
    func onTapSaveButton(user: User) {
        guard let token = UserDefaultsRepositry.shared.getToken() else { return }
        interactor.updateUserProfile(user: user,token: token).subscribe {
            self.view.updateUserInfo()
        } onError: { [weak self] _ in
            self?.view.showError()
        }.disposed(by: disposeBag)
    }
    func onTapDismissButton() {
        router.dismiss()
    }
    
}
