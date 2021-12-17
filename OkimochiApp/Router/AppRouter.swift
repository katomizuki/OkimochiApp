//
//  AppRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/17.
//

import Foundation
import UIKit
class AppRouter {
    static func start(controller:UITabBarController) {
        let timeLineVC = UIStoryboard(name: "MainTab", bundle: nil).instantiateViewController(withIdentifier: "TimeLineController") as! TimeLineController
        let timeLineInteractor = TimeLineInteractor()
        let timeLineRouter = TimeLineRouter()
        let timeLinePresentar = TimeLinePresentar(DI: TimeLinePresentar.DI(view: timeLineVC, router: timeLineRouter, interactor: timeLineInteractor))
        timeLineVC.presentar = timeLinePresentar
        
        let postLetterVC = UIStoryboard(name: "PostLetter", bundle: nil).instantiateViewController(withIdentifier: "PostLetterController") as! PostLetterController
        let postInteractor = PostLetterInteractor()
        let postRouter = PostLetterRouter()
        let postPresentar = PostLetterPresentar(DI: PostLetterPresentar.DI(view: postLetterVC, interactor: postInteractor, router: postRouter))
        postLetterVC.presentar = postPresentar
        
        let userVC = UIStoryboard(name: "UserProfile", bundle: nil).instantiateViewController(withIdentifier: "UserProfileController") as! UserProfileController
        let userInteractor = UserProfileInteractor()
        let userRouter = UserProfileRouter()
        let userPresentar = UserProfilePresentar(DI: UserProfilePresentar.DI(router: userRouter, interactor: userInteractor, view: userVC))
        userVC.presentar = userPresentar
    }
}
