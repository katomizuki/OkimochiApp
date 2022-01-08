//
//  OpenLetterUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import RxSwift

protocol OpenLetterUseCase {
    func fetchLetterDetail(letterId:String)->Single<Letter>
}
