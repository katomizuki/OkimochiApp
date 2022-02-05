//
//  FinishLetterInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

import RxSwift

final class FinishLetterInteractor: FinishLetterUseCase {

    let service: PostServiceProtocol
    init(service: PostServiceProtocol) {
        self.service = service
    }
    func postLetter(dic: [String: Any], token: String) -> Completable {
        //        let dic:[String:Any] = ["who":letter.who,
        //                   "title":letter.title,
        //                   "pic_name":letter.imageUrl,
        //                   "open_time":letter.openTime,
        //                   "open_place_name":letter.openPlaceName,
        //                    "open_place_latitude":letter.latitude,
        //                    "open_place_longitude":letter.longitude,
        //                   "public":0]
        return service.postLetter(dic: dic, token: token)
    }

}
