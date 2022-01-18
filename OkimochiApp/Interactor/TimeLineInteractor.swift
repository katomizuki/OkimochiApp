//
//  TimeLineInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift

final class TimeLineInteractor:TimeLineUseCase {
    let service:PostServiceProtocol
    init(service:PostServiceProtocol) {
        self.service = service
    }
    func fetchTimeLines(token:String) -> Single<[Letter]> {
        self.service.getLetters(token: token)
    }
}
