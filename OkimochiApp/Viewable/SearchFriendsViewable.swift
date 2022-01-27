//
//  SearchFriendsViewable.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

protocol SearchFriendsViewable: Transitioner {
    func showError()
    func showResult(_ user:[User])
}
