//
//  UpdateProfileRouter.swift
//  OkimochiApp
//
//  Created by ミズキ on 2021/12/16.
//

import Foundation
 
final class UpdateProfileRouter: UpdateProfileWireframe {
    private (set) weak var view:UpdateProfileViewable!
    init(view:UpdateProfileViewable) {
        self.view = view
    }
    func dismiss() {
        
    }
}
