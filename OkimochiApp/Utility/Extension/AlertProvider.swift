//
//  AlertProvider.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/25.
//

import UIKit

struct AlertProvider {
    static func makeCommonAlert() -> UIAlertController {
        let alertVC = UIAlertController(title: "通信エラーです", message: "OK", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "もどる", style: .cancel)
        alertVC.addAction(alertAction)
        return alertVC
    }
}
