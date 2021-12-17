//
//  AnyRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Foundation
import UIKit
protocol Transitioner: AnyObject where Self:UIViewController {
    func pushViewController(_ viewController:UIViewController,animated:Bool)
    func popViewController(animated:Bool)
    func popToRootViewController(_ viewController:UIViewController, animated:Bool)
    func present(viewContoller:UIViewController,animated:Bool)
    func dismiss(animated:Bool)
}

extension Transitioner {
    func pushViewController(_ viewController: UIViewController,
                            animated: Bool) {
        guard let nc = navigationController else { return }
        nc.pushViewController(viewController, animated: animated)
    }
    func popViewController(animated:Bool) {
        guard let nc = navigationController else { return }
        nc.popViewController(animated: animated)
    }
    func popToRootViewController(_ viewController:UIViewController, animated:Bool) {
        guard let 
    }
    func present(viewController: UIViewController,
                 animated: Bool,
                 completion: (() -> ())? = nil) {
        present(viewController, animated: animated, completion: completion)
    }
    func dismiss(animated: Bool) {
        dismiss(animated: animated)
    }
}
