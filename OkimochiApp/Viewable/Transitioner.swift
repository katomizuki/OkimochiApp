//
//  AnyRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import UIKit
protocol Transitioner where Self: UIViewController {
    func pushViewController(_ viewController: UIViewController, animated: Bool)
    func popViewController(animated: Bool)
    func popToRootViewController(animated: Bool)
    func present(viewController: UIViewController,
                 animated: Bool,
                 completion: (() -> Void)?)
    func dismiss(animated: Bool)
}

extension Transitioner {
    func pushViewController(_ viewController: UIViewController,
                            animated: Bool) {
        guard let nc = navigationController else { return }
        nc.pushViewController(viewController, animated: animated)
    }

    func popViewController(animated: Bool) {
        guard let nc = navigationController else { return }
        nc.popViewController(animated: true)
    }

    func popToRootViewController(animated: Bool) {
        guard let nc = navigationController else { return }
        nc.popToRootViewController(animated: true)
    }

    func present(viewController: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
        present(viewController, animated: animated, completion: completion)
    }

    func dismiss(animated: Bool) {
        dismiss(animated: animated)
    }
}
