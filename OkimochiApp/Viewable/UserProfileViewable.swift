//
//  UserProfileViewable.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

protocol UserProfileViewable: Transitioner {
    func setViewData(_ viewData:ProfileHeaderViewData)
    func setLetterViewData(_ viewData: UserLetterViewData)
    func showError()
    func reload()
}
