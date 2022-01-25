//
//  TimeLineViewable.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

protocol TimeLineViewable: Transitioner {
    func setLetters(_ viewData: TimeLineViewData)
    func showError()
    func reload()
}
