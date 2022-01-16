//
//  FinishLetterInteractor.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//


final class FinishLetterInteractor:FinishLetterUseCase {

    
    
    
    let service:PostServiceProtocol
    init(service:PostServiceProtocol) {
        self.service = service
    }
    func sendLetter(_ letter: Letter, completion: @escaping (Result<Void, Error>) -> Void) {
        service.postLetter(dic: [:], completion: completion)
    }

 
    
    
}
