//
//  LetterDetailViewable.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

protocol LetterDetailViewable: Transitioner {
    func showError()
    func completeUpdate()
    func setLetterViewData(_ viewData: LetterDetailViewData)
}
