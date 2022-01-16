//
//  UserProfileViewable.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

protocol UserProfileViewable: Transitioner {
    func setViewData(_ viewData:ProfileHeaderViewData)
    func setLetters(_ letters:[Letter])
    func showError()
    func reload()
}
