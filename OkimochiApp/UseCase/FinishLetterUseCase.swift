//
//  FinishLetterUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//
import RxSwift
protocol FinishLetterUseCase {
    func postLetter(dic: [String: Any], token: String) -> Completable
}
