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
    func fetchTimeLines() -> Single<[Letter]> {
        return Single.create { singleEvent->Disposable in
            self.service.getLetters { result in
                switch result {
                case .success(let letters):
                    singleEvent(.success(letters))
                case .failure(let error):
                    singleEvent(.failure(error))
                }
            }
            return Disposables.create()
        }
    }
}
