//
//  TimeLinePresentar.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Foundation
final class TimeLinePresentar:TimeLinePresentable {
    
    struct DI {
        var view:TimeLineViewable
        var router:TimeLineWireframe
        var interactor:TimeLineUseCase
    }
    weak var view:TimeLineViewable!
    var router:TimeLineWireframe!
    var interactor:TimeLineUseCase!
    init(DI:DI) {
        self.view = DI.view
        self.interactor = DI.interactor
        self.router = DI.router
    }
}
