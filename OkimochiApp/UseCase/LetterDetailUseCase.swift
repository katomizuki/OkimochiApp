//
//  LetterDetailUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import RxSwift

protocol LetterDetailUseCase {
    func fetchLetterDetail()->Single<User>
}
