//
//  FriendDetailPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Combine

final class FriendDetailPresentar: FriendDetailPresentable {

    struct DI {
        var view: FriendsDetailViewable
        var interactor: FriendDetailUseCase
        var router: FriendsDetailWireframe
    }

    weak var view: FriendsDetailViewable!
    var interactor: FriendDetailUseCase!
    var router: FriendsDetailWireframe!

    init(DI: DI) {
        self.view = DI.view
        self.router = DI.router
        self.interactor = DI.interactor
    }
    func onApplyFriendButton() {
        guard let token = UserDefaultsRepositry.shared.getToken() else { return }
        _ = interactor.applyFriend(token: token, id: "")
            .sink { [weak self] completion in
                switch completion {
                case .finished: print("finish")
                case .failure: self?.view.showError()
                }
            } receiveValue: { _ in }

    }
    func viewDidLoad() {
        _ = self.interactor.getUserDetail(userId: "")
            .sink(receiveCompletion: { [weak self] _ in
                self?.view.showError()
            }) { _ in

            }
    }

    func onTapBlockButton() {
        guard let token = UserDefaultsRepositry.shared.getToken() else { return }
        _ = interactor.blockFriend(token: token, id: "")
            .sink { [weak self] completion in
                switch completion {
                case .finished: print("finish")
                case .failure: self?.view.showError()
                }
            } receiveValue: { _ in }

    }

    func rejectFriendButton() {
        guard let token = UserDefaultsRepositry.shared.getToken() else { return }
        _ = interactor.rejectFriend(token: token, id: "")
            .sink { [weak self] completion in
                switch completion {
                case .finished: print("finish")
                case .failure: self?.view.showError()
                }
            } receiveValue: { _ in }

    }

    func onTapDismissButton() {
        router.transitionDismiss()
    }
}
