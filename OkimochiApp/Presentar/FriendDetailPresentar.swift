//
//  FriendDetailPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift

final class FriendDetailPresentar: FriendDetailPresentable {

    struct DI {
        var view: FriendsDetailViewable
        var interactor: FriendDetailUseCase
        var router: FriendsDetailWireframe
    }

    weak var view: FriendsDetailViewable!
    var interactor: FriendDetailUseCase!
    var router: FriendsDetailWireframe!
    private let disposeBag = DisposeBag()
    init(DI: DI) {
        self.view = DI.view
        self.router = DI.router
        self.interactor = DI.interactor
    }
    func onApplyFriendButton() {
        guard let token = UserDefaultsRepositry.shared.getToken() else { return }
        self.interactor.applyFriend(token: token, id: "").subscribe {

        } onError: { [weak self] _ in
            self?.view.showError()
        }.disposed(by: disposeBag)

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
        self.interactor.blockFriend(token: token, id: "").subscribe {

        } onError: { [weak self] _ in
            self?.view.showError()
        }.disposed(by: disposeBag)

    }

    func rejectFriendButton() {
        guard let token = UserDefaultsRepositry.shared.getToken() else { return }
        self.interactor.rejectFriend(token: token, id: "").subscribe {

        } onError: { [weak self] _ in
            self?.view.showError()
        }.disposed(by: disposeBag)

    }

    func onTapDismissButton() {
        router.transitionDismiss()
    }

}
