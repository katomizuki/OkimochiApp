//
//  UserLetterViewData.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/25.
//

struct UserLetterViewData {
    
    var myLetter = [Letter]()
    var saveLetter = [Letter]()
    
    init(myLetter:[Letter],saveLetter:[Letter]) {
        self.myLetter = myLetter
        self.saveLetter = saveLetter
    }
}
