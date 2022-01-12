//
//  LetterFriendUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import RxSwift

protocol LetterFriendUseCase {
    func fetchFriends(uid:String)->Single<[User]>
}
