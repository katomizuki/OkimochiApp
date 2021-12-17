//
//  UserProfileRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import UIKit


final class UserProfileRouter: UserProfileWireframe {
    private (set) weak var wireframe:UserProfileWireframe!
    
    init(wireframe:UserProfileWireframe) {
        self.wireframe = wireframe
    }
    func transitionUpdateUserProfile() {
        let controller = UIStoryboard(name: "UpdateProfile", bundle: nil).instantiateViewController(withIdentifier: "UpdateProfileController") as! UpdateProfileController
        let interactor = UpdateProfileInteractor()
        let router = UpdateProfileRouter()
        let presentar = UpdateProfilePresentar(DI: UpdateProfilePresentar.DI(router: router, view: controller, interactor: interactor))
        controller.presentar = presentar
        controller.modalPresentationStyle = .fullScreen
        
    }
    
    
}
