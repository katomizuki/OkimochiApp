//
//  UpdateProfileViewable.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

protocol UpdateProfileViewable: Transitioner {
    func showError()
    func updateUserInfo()
    func setViewData(_ viewData: UserViewData)
}
