//
//  FinishLetterInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import Combine

final class FinishLetterInteractor: FinishLetterUseCase {

    let service: PostServiceProtocol
    init(service: PostServiceProtocol) {
        self.service = service
    }
    func postLetter(dic: [String: Any], token: String) -> Future<CompletableEntity, Error> {
        return service.postLetter(dic: dic, token: token)
    }

}
