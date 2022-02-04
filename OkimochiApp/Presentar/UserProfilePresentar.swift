//
//  UserProfilePresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift


final class UserProfilePresentar: UserProfilePresentable {
    
    struct DI {
        var router:UserProfileWireframe
        var interactor:UserProfileUseCase
        var view:UserProfileViewable
    }
    weak var view:UserProfileViewable!
    var interactor:UserProfileUseCase
    var router:UserProfileWireframe
    private let disposeBag = DisposeBag()
    init(DI:DI) {
        self.router = DI.router
        self.interactor = DI.interactor
        self.view = DI.view
    }
    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        guard let token = UserDefaultsRepositry.shared.getToken() else { return }
        
        interactor.fetchUser(token: token)
            .observe(on: MainScheduler.instance)
            .subscribe { [weak self] viewData in
            self?.view.setViewData(viewData)
            self?.view.reload()
        } onFailure: { [weak self] _ in
            self?.view.showError()
        }.disposed(by: disposeBag)

        interactor.fetchMyLetter(token: token)
            .observe(on: MainScheduler.instance)
            .subscribe { [weak self] viewData in
                self?.view.setLetterViewData(viewData)
            } onFailure: { [weak self] _ in
                self?.view.showError()
            }.disposed(by: disposeBag)
        
        interactor.fetchMyFriends(token: token)
            .observe(on: MainScheduler.instance)
            .subscribe { [weak self] viewData in
                self?.view.setFriendViewData(viewData)
            } onFailure: { [weak self] _ in
                self?.view.showError()
            }.disposed(by: disposeBag)
    }
    
    func onTapUpdateButton() {
        print(#function)
        router.transitionUpdateUserProfile()
    }
    
    func onTapPastButton() {
        
    }
    
    func onTapFriendsButton() {
        
    }
    func onTapSearchButton() {
        router.transitionSearchUser()
    }
    func onTapLetterDetail() {
        router.transitionLetterDetail()
    }
    func onTapLogoutButton() {
        
    }
    func onTapOptionsButton(_ selectOptions: ProfileFilterOptions) {
        switch selectOptions {
        case .fav:
            print("fav")
        case .past:
            print("past")
        case .info:
            print("info")
        }
    }
}
