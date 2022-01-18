//
//  TimeLinePresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import UIKit
import RxSwift
final class TimeLinePresentar:TimeLinePresentable {
   
    struct DI {
        var view:TimeLineViewable
        var router:TimeLineWireframe
        var interactor:TimeLineUseCase
    }
    weak var view:TimeLineViewable!
    var router:TimeLineWireframe!
    var interactor:TimeLineUseCase!
    private let disposeBag = DisposeBag()
    init(DI:DI) {
        self.view = DI.view
        self.interactor = DI.interactor
        self.router = DI.router
    }
    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        guard let token = UserDefaultsRepositry.shared.getToken() else { return }
        interactor.fetchTimeLines(token: token)
            .observe(on: MainScheduler.instance)
            .subscribe { [weak self] letters in
                self?.view.setLetters(letters)
            } onFailure: { [weak self] _ in
                self?.view.showError()
            }.disposed(by: disposeBag)
    }
    
    func onTapLetter() {
        router.transitionLetterDetail()
    }
    func notToken() {
        print(#function)
        if UserDefaultsRepositry.shared.getToken() == nil {
            router.transitionLogin()
        }
    }
    func segue(segue:UIStoryboardSegue) {
        router.setupDI(segue: segue)
    }
    
    
}
