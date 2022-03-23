//
//  TimeLineInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Combine

final class TimeLineInteractor: TimeLineUseCase {
    let service: PostServiceProtocol
    init(service: PostServiceProtocol) {
        self.service = service
    }
    func fetchTimeLines(token: String) -> Future<TimeLineViewData, Error> {
        return Future<TimeLineViewData, Error> { promise in
            self.service.getLetters(token: token)
                .sink { completion in
                    switch completion {
                    case .failure(let error): promise(.failure(error))
                    case .finished: print("finish")
                    }
                } receiveValue: { letters in
                    promise(.success(TimeLineViewData(letters: letters)))
                }
        }
    }
}
