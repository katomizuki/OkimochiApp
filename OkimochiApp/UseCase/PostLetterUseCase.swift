//
//  PostLetterUseCase.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/17.
//
protocol PostLetterUseCase {
    func postLetter(letter:Letter,completion:@escaping(Error?)->Void)
}
