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
        let controller = UIStoryboard(name: "UpdateProfile", bundle: nil).instantiateViewController(withIdentifier: UpdateProfileController.id) as! UpdateProfileController
        let interactor = UpdateProfileInteractor(service: UserService())
        let router = UpdateProfileRouter(view: controller)
        let presentar = UpdateProfilePresentar(DI: UpdateProfilePresentar.DI(router: router, view: controller, interactor: interactor))
        controller.presentar = presentar
        controller.modalPresentationStyle = .fullScreen
        view.present(controller, animated: true, completion: nil)
    }
     
     func transitionSearchUser() {
         let storyboard = UIStoryboard(name: "UserProfile", bundle: nil)
         let controller = storyboard.instantiateViewController(withIdentifier: SearchFriendsController.id) as! SearchFriendsController
         let interactor = SearchFriendsInteractor(service: UserService())
         let router = SearchFriendsRouter(view: controller)
         let presentar = SearchFriendPresentar(DI: SearchFriendPresentar.DI(router: router, view: controller, interactor: interactor))
         controller.presentar = presentar
         view.navigationController?.pushViewController(controller, animated: true)
     }
    
    func transitionLetterDetail() {
        let storyboard = UIStoryboard(name: "UserProfile", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: LetterDetailController.id) as! LetterDetailController
        view.navigationController?.pushViewController(controller, animated: true)
    }
}

