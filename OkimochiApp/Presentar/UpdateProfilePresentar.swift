//
//  UpdateProfilePresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Foundation
final class UpdateProfilePresentar: UpdateProfilePresentable {

    struct DI {
        var router: UpdateProfileWireframe
        var view: UpdateProfileViewable
        var interactor: UpdateProfileUserCase
    }
    var router: UpdateProfileWireframe!
    var interactor: UpdateProfileUserCase!
    weak var view: UpdateProfileViewable!

    init(DI: DI) {
        self.view = DI.view
        self.interactor = DI.interactor
        self.router = DI.router
    }
    func viewDidLoad() {

    }

    func viewWillAppear() {
        guard let token = UserDefaultsRepositry.shared.getToken() else { return }

        _ = interactor.getUser(token: token)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                switch completion {
                case .failure:
                    self?.view.showError()
                case .finished:
                    print("finish")
                }
            } receiveValue: { [weak self] viewData in
                self?.view.setViewData(viewData)
            }
    }

    func onTapSaveButton(user: User) {
        guard let token = UserDefaultsRepositry.shared.getToken() else { return }
        _ = interactor.updateUserProfile(user: user, token: token)
            .sink { [weak self] completion in
                switch completion {
                case .failure: self?.view.showError()
                case .finished: self?.view.updateUserInfo()
                }
            } receiveValue: { _ in }
    }
    func onTapDismissButton() {
        router.dismiss()
    }

}
