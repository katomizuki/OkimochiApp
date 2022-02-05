//
//  LetterFriendPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import RxSwift

final class LetterFriendPresentar: LetterFriendPresentable {
    struct DI {
        var view: LetterFriendViewable
        var router: LetterFriendWireframe
        var interactor: LetterFriendUseCase
    }
    weak var view: LetterFriendViewable!
    var router: LetterFriendWireframe
    var interactor: LetterFriendUseCase
    private let disposeBag = DisposeBag()
    init(DI: DI) {
        self.view = DI.view
        self.router = DI.router
        self.interactor = DI.interactor
    }
    func viewDidLoad() {
        guard let token = UserDefaultsRepositry.shared.getToken() else { return }
        self.interactor.fetchFriends(uid: "", token: token).subscribe { [weak self] viewData in
            self?.view.setFriends(viewData)
        } onFailure: { [weak self] _ in
            self?.view.showError()
        }.disposed(by: disposeBag)

    }
}
