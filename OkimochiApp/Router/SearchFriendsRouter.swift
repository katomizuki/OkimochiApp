//
//  SearchFriendsRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import UIKit

final class SearchFriendsRouter: SearchFriendsWireframe {
    private (set) weak var view: SearchFriendsViewable!
    init(view: SearchFriendsViewable) {
        self.view = view
    }
    func transitionDetail() {
        let storyboard = UIStoryboard(name: "UserProfile", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: FriendDetailController.id) as! FriendDetailController
        let interactor = FriendDetailInteractor(service: UserService())
        let router = FriendDetailRouter(view: controller)
        controller.presentar = FriendDetailPresentar(DI: FriendDetailPresentar.DI(view: controller, interactor: interactor, router: router))
        view.navigationController?.pushViewController(controller, animated: true)
    }
}
