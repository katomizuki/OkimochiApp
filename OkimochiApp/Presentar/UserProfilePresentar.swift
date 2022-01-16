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
        
        interactor.fetchUser()
            .observe(on: MainScheduler.instance)
            .subscribe { [weak self] viewData in
            self?.view.setViewData(viewData)
        } onFailure: { [weak self] _ in
            self?.view.showError()
        }.disposed(by: disposeBag)

        interactor.fetchMyLetter()
            .observe(on: MainScheduler.instance)
            .subscribe { [weak self] letters in
                self?.view.setLetters(letters)
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
}
