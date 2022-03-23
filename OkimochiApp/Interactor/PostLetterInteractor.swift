//
//  PostLetterInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/17.
//

import Combine

final class PostLetterInteractor: PostLetterUseCase {
    let service: PostServiceProtocol

    init(service: PostServiceProtocol) {
        self.service = service
    }

    func postLetter(token: String, dic: [String: Any]) -> Future<CompletableEntity, Error> {
        self.service.postLetter(dic: dic, token: token)
    }

}
