//
//  TimeLineInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift

final class TimeLineInteractor: TimeLineUseCase {
    let service: PostServiceProtocol
    init(service: PostServiceProtocol) {
        self.service = service
    }
    func fetchTimeLines(token: String) -> Single<TimeLineViewData> {
        return Single.create { observer in
            self.service.getLetters(token: token).subscribe { letters in
                observer(.success(TimeLineViewData(letters: letters)))
            } onFailure: { error in
                observer(.failure(error))
            }
        }
    }
}
