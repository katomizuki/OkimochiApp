//
//  LoginViewable.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

protocol LoginViewable: Transitioner {
    func showError()
    func completedLogin()
}
