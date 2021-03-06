//
//  UserProfilePresentable.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

protocol UserProfilePresentable {
    func viewDidLoad()
    func viewWillAppear()
    func onTapUpdateButton()
    func onTapPastButton()
    func onTapFriendsButton()
    func onTapSearchButton()
    func onTapLetterDetail()
    func onTapLogoutButton()
    func onTapOptionsButton(_ selectOptions: ProfileFilterOptions)
}
