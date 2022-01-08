//
//  TimeLineInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift

final class TimeLineInteractor:TimeLineUseCase {
    func fetchTimeLines() -> Single<[Letter]> {
        return Single.create { singleEvent->Disposable in
            return Disposables.create()
        }
    }
}
