//
//  FinishLetterUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/18.
//

protocol FinishLetterUseCase {
    func sendLetter(_ letter:Letter,completion:@escaping(Result<Void,Error>)->Void)
}
