//
//  PostLetterUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/17.
//
import RxSwift
protocol PostLetterUseCase {
    func postLetter(token: String, dic: [String: Any]) -> Completable
}
