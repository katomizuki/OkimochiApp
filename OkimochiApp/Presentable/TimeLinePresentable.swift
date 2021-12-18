//
//  TimeLinePresentable.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import UIKit

protocol TimeLinePresentable {
    func viewDidLoad()
    func viewWillAppear()
    func onTapLetter()
    func notToken()
    func segue(segue:UIStoryboardSegue)
}
