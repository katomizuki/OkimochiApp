//
//  PostLetterInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/17.
//

import RxSwift

final class PostLetterInteractor: PostLetterUseCase {
    let service: PostServiceProtocol

    init(service: PostServiceProtocol) {
        self.service = service
    }

}
