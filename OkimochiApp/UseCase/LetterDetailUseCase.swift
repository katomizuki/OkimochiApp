//
//  LetterDetailUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Combine

protocol LetterDetailUseCase {
    //    func fetchLetterDetail() -> Single<User>
    func updateLetterDetail(token: String, dic: [String: Any]) -> Future<CompletableEntity, Error>
}
