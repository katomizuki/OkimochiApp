//
//  SearchFriendPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Combine

final class SearchFriendPresentar: SearchFriendPresentable {

    struct DI {
        var router: SearchFriendsWireframe
        var view: SearchFriendsViewable
        var interactor: SearchFriendUseCase
    }
    weak var view: SearchFriendsViewable!
    var interactor: SearchFriendUseCase!
    var router: SearchFriendsWireframe!

    init(DI: DI) {
        self.view = DI.view
        self.interactor = DI.interactor
        self.router = DI.router
    }
    func viewDidLoad() {

    }

    func searchFriend(_ text: String) {
        guard let token = UserDefaultsRepositry.shared.getToken() else { return }
        _ = self.interactor.searchUser(text: text, token: token)
            .sink { [weak self] completion in
                switch completion {
                case .failure: self?.view.showError()
                case .finished: print("finish")
                }
            } receiveValue: { [weak self] users in
                self?.view.showResult(users)
            }
    }

    func onTapCell() {
        router.transitionDetail()
    }
}
