//
//  UpdateProfilePresentable.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

protocol UpdateProfilePresentable {
    func viewDidLoad()
    func viewWillAppear()
    func onTapSaveButton(user: User)
    func onTapDismissButton()
}
