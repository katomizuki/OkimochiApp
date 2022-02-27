//
//  OpenLetterViewable.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

protocol OpenLetterViewable: Transitioner {
    func showError()
    func completedOpenLetter()
    func setLetterViewData(_ viewData: OpenLetterViewData)
}
