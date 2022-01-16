//
//  LoginPresentable.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

protocol LoginPresentable {
    func onTapLoginButton(email: String, password: String)
    func onTapGotoRegisterButton()
}
