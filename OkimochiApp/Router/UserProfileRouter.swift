//
//  UserProfileRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import UIKit


 class UserProfileRouter: UserProfileWireframe {
     private (set) weak var view:UserProfileViewable!
     init(view:UserProfileViewable) {
         self.view = view
     }
    func transitionUpdateUserProfile() {
        print(#function)
        let controller = UIStoryboard(name: "UpdateProfile", bundle: nil).instantiateViewController(withIdentifier: "UpdateProfileController") as! UpdateProfileController
        let interactor = UpdateProfileInteractor()
        let router = UpdateProfileRouter()
        let presentar = UpdateProfilePresentar(DI: UpdateProfilePresentar.DI(router: router, view: controller, interactor: interactor))
        controller.presentar = presentar
        view.performSegue(withIdentifier: "gotoUpdateProfileController", sender: nil)
    }
}

