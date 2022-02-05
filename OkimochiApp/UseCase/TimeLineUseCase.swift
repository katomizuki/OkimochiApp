//
//  TimeLineUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//
import RxSwift
protocol TimeLineUseCase {
    func fetchTimeLines(token: String)->Single<TimeLineViewData>
}
