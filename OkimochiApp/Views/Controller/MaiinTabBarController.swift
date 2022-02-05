//
//  TabBarController.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/17.
//

import UIKit
class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        AppRouter.start(controller: self)

    }
}
