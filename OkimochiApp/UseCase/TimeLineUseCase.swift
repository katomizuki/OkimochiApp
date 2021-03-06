//
//  TimeLineUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//
import Combine

protocol TimeLineUseCase {
    func fetchTimeLines(token: String) -> Future<TimeLineViewData, Error>
}
