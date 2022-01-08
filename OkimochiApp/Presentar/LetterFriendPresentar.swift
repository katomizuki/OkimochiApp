//
//  LetterFriendPresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//


final class LetterFriendPresentar:LetterFriendPresentable {
    struct DI {
        var view:LetterFriendViewable
        var router:LetterFriendWireframe
        var interactor:LetterFriendUseCase
    }
    weak var view:LetterFriendViewable!
    var router:LetterFriendWireframe
    var interactor:LetterFriendUseCase
    init(DI:DI) {
        self.view = DI.view
        self.router = DI.router
        self.interactor = DI.interactor
    }
    func viewDidLoad() {
        
    }
}
