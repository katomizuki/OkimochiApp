//
//  FinishLetterInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import RxSwift

final class FinishLetterInteractor: FinishLetterUseCase {

    let service: PostServiceProtocol
    init(service: PostServiceProtocol) {
        self.service = service
    }
    func postLetter(dic: [String: Any], token: String) -> Completable {
        return service.postLetter(dic: dic, token: token)
    }

}
