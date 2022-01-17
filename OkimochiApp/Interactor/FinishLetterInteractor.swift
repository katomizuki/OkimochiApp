//
//  FinishLetterInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import UIKit


final class FinishLetterInteractor:FinishLetterUseCase {

    
    
    
    let service:PostServiceProtocol
    init(service:PostServiceProtocol) {
        self.service = service
    }
    func sendLetter(_ letter: Letter, completion: @escaping (Result<Void, Error>) -> Void) {
        let dic:[String:Any] = ["who":letter.who,
                   "title":letter.title,
                   "pic_name":letter.imageUrl,
                   "open_time":letter.openTime,
                   "open_place_name":letter.openPlaceName,
                    "open_place_latitude":letter.latitude,
                    "open_place_longitude":letter.longitude,
                   "public":0]
        service.postLetter(dic: dic, completion: completion)
    }

    
    
}
