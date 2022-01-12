//
//  AppRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/17.
//

import Foundation
import UIKit
class AppRouter {
    static func start(controller:MainTabBarController) {
        let timeLineVC = controller.viewControllers![0] as! TimeLineController
        let timeLineInteractor = TimeLineInteractor(service: PostService())
        let timeLineRouter = TimeLineRouter(view: timeLineVC)
        let timeLinePresentar = TimeLinePresentar(DI: TimeLinePresentar.DI(view: timeLineVC, router: timeLineRouter, interactor: timeLineInteractor))
        timeLineVC.presentar = timeLinePresentar
        
        let postLetterNav = controller.viewControllers![1] as! PostLetterNavigationController
        let postLetterVC = postLetterNav.viewControllers[0] as! PostLetterController
        let postInteractor = PostLetterInteractor()
        let postRouter = PostLetterRouter(view: postLetterVC)
        let postPresentar = PostLetterPresentar(DI: PostLetterPresentar.DI(view: postLetterVC, interactor: postInteractor, router: postRouter))
        postLetterVC.presentar = postPresentar
        
        let userNav = controller.viewControllers![2] as! UserNavigationController
        let userVC = userNav.viewControllers[0] as! UserProfileController
        let userInteractor = UserProfileInteractor()
        let userRouter = UserProfileRouter(view: userVC)
        let userPresentar = UserProfilePresentar(DI: UserProfilePresentar.DI(router: userRouter, interactor: userInteractor, view: userVC))
        userVC.presentar = userPresentar
    }
}
