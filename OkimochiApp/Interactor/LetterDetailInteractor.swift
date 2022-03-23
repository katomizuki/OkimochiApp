//
//  LetterDetailInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Combine

final class LetterDetailInteractor: LetterDetailUseCase {
    let service: PostServiceProtocol
    init(service: PostServiceProtocol) {
        self.service = service
    }

    func updateLetterDetail(token: String, dic: [String: Any]) -> Future<CompletableEntity, Error> {
        self.service.updateLetter(id: "", token: token, parameter: dic)
    }
}
