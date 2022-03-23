//
//  TimeLinePresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Combine
import Foundation
final class TimeLinePresentar: TimeLinePresentable {

    struct DI {
        var view: TimeLineViewable
        var router: TimeLineWireframe
        var interactor: TimeLineUseCase
    }
    weak var view: TimeLineViewable!
    var router: TimeLineWireframe!
    var interactor: TimeLineUseCase!

    init(DI: DI) {
        self.view = DI.view
        self.interactor = DI.interactor
        self.router = DI.router
    }
    func viewDidLoad() {

    }

    func viewWillAppear() {
        guard let token = UserDefaultsRepositry.shared.getToken() else { return }
        _ = interactor.fetchTimeLines(token: token)
            .receive(on: RunLoop.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished: print("finish")
                case .failure: self?.view.showError()
                }
            } receiveValue: { [weak self] viewData in
                self?.view.setLetters(viewData)
            }
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
    func segue() {
        router.transitionOpenLetter()
    }

    func onTapBlockButton() {

    }

}
