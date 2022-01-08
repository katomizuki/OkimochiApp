//
//  UserProfileUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//
import RxSwift
protocol UserProfileUseCase {
    func fetchUser()->Single<User>
    func fetchMyLetter()->Single<[Letter]>
}
