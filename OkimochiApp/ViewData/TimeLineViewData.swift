//
//  TimeLineViewData.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/25.
//

struct TimeLineViewData {
    private var letters = [Letter]()

    init(letters: [Letter]) {
        self.letters = letters
    }
    var numberOfCell: Int {
        return letters.count
    }

}
