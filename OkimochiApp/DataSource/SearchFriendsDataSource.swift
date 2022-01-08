//
//  SearchFriendsDataSource.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/08.
//

import UIKit
class SearchFriendsDataSource:NSObject, UITableViewDataSource {
    var users = [User]()
    var filterUsers = [User]()
    var isSearched = false
    func initUsersData(_ users: [User]) {
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.id, for: indexPath) as? FriendCell else { fatalError() }
        let user = isSearched ? filterUsers[indexPath.row] : users[indexPath.row]
        let viewData = FrinedCellViewData(user: user)
        cell.viewData = viewData
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isSearched ? filterUsers.count : users.count
    }
}
