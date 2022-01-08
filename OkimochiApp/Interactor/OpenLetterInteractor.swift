//
//  OpenLetterInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import RxSwift
final class OpenLetterInteractor:OpenLetterUseCase {
    func fetchLetterDetail(letterId: String) -> Single<Letter> {
        return Single.create { singleEvent->Disposable in
            return Disposables.create()
        }
    }
    
    
}
