//
//  SearchFriendPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift


final class SearchFriendPresentar:SearchFriendPresentable {
    
    struct DI {
        var router:SearchFriendsWireframe
        var view: SearchFriendsViewable
        var interactor:SearchFriendUseCase
    }
    weak var view:SearchFriendsViewable!
    var interactor:SearchFriendUseCase!
    var router:SearchFriendsWireframe!
    private let disposeBag = DisposeBag()
    init(DI:DI) {
        self.view = DI.view
        self.interactor = DI.interactor
        self.router = DI.router
    }
    func viewDidLoad() {
        
    }
    
    func searchFriend(_ text: String) {
        guard let token = UserDefaultsRepositry.shared.getToken() else { return }
        self.interactor.searchUser(text: text, token: token).subscribe { [weak self] users in
            self?.view.showResult(users)
        } onFailure: { [weak self] _ in
            self?.view.showError()
        }.disposed(by: disposeBag)

    }
    
    func onTapCell() {
        router.transitionDetail()
    }
}
