//
//  LetterDetailInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift


final class LetterDetailInteractor:LetterDetailUseCase {
    let service:PostServiceProtocol
    init(service:PostServiceProtocol) {
        self.service = service
    }
    func fetchLetterDetail() -> Single<User> {
        return Single.create { singleEvent->Disposable in
            return Disposables.create()
        }
    }
}
