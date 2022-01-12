//
//  UserProfileViewable.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

protocol UserProfileViewable: Transitioner {
    func setUser(_ user:User)
    func setLetters(_ letters:[Letter])
    func showError()
}
