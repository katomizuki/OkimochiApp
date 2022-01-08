//
//  UpdateProfileDataSource.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/08.
//

import UIKit
class UpdateProfileTableViewManager:NSObject,UITableViewDataSource {
    var user:User?
    func initUserData(_ user:User) {
        self.user = user
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UpdateProfileTableCell.id, for: indexPath) as? UpdateProfileTableCell else { fatalError()}
        guard let section = UpdateProfileSection(rawValue: indexPath.row) else { return cell }
        guard let user = user else { return cell }
        cell.viewData = UpdateProfileViewData(user: user, sectons: section)
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return UpdateProfileSection.allCases.count
    }
}
