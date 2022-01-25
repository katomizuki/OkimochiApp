//
//  MyLetterResult+Extension.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/25.
//

extension MyLetterResult {
    func convertToViewData() -> UserLetterViewData {
        let myLetters:[Letter] = self.myPost.map( { Letter(title: $0.okimochi.title, text: $0.okimochi.message, isOpen: $0.okimochi.isOpen, sendType: .you, who: $0.okimochi.who, imageUrl: $0.okimochi.picName, openTime: $0.okimochi.openTime, openPlaceName: $0.okimochi.openPlaceName, latitude: $0.okimochi.openPlaceLatitude, longitude: $0.okimochi.openPlaceLongitude) } )
        let saveLetter:[Letter] = self.saves.map({ Letter(title: $0.okimochi.title, text: $0.okimochi.message, isOpen: $0.okimochi.isOpen, sendType: .you, who: $0.okimochi.who, imageUrl: $0.okimochi.picName, openTime: $0.okimochi.openTime, openPlaceName: $0.okimochi.openPlaceName, latitude: $0.okimochi.openPlaceLatitude, longitude: $0.okimochi.openPlaceLongitude) })
        return UserLetterViewData(myLetter: myLetters, saveLetter: saveLetter)
    }
}
