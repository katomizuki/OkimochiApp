//
//  LetterFriendPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import RxSwift


final class LetterFriendPresentar:LetterFriendPresentable {
    struct DI {
        var view:LetterFriendViewable
        var router:LetterFriendWireframe
        var interactor:LetterFriendUseCase
    }
    weak var view:LetterFriendViewable!
    var router:LetterFriendWireframe
    var interactor:LetterFriendUseCase
    private let disposeBag = DisposeBag()
    init(DI:DI) {
        self.view = DI.view
        self.router = DI.router
        self.interactor = DI.interactor
    }
    func viewDidLoad() {
        self.interactor.fetchFriends(uid: "").subscribe { [weak self] users in
            self?.view.setFriends(users)
        } onFailure: { [weak self] _ in
            self?.view.showError()
        }.disposed(by: disposeBag)

    }
}
