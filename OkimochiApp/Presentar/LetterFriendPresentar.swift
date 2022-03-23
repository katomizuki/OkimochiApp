//
//  LetterFriendPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import Combine

final class LetterFriendPresentar: LetterFriendPresentable {
    struct DI {
        var view: LetterFriendViewable
        var router: LetterFriendWireframe
        var interactor: LetterFriendUseCase
    }
    weak var view: LetterFriendViewable!
    var router: LetterFriendWireframe
    var interactor: LetterFriendUseCase

    init(DI: DI) {
        self.view = DI.view
        self.router = DI.router
        self.interactor = DI.interactor
    }
    func viewDidLoad() {
        guard let token = UserDefaultsRepositry.shared.getToken() else { return }
        _ = interactor.fetchFriends(uid: "", token: token)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    print("finish")
                case .failure:
                    self?.view.showError()
                }
            }) { [weak self] _ in
                //                self?.view.setFriends(viewData)
            }
    }
}
