//
//  PostDataSource.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/08.
//

import UIKit
 class PostDataSource:NSObject,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SendWhoType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LetterWhoTypeCell.id, for: indexPath) as? LetterWhoTypeCell else { fatalError() }
        cell.whoType = SendWhoType(rawValue: indexPath.row)
        return cell
    }
}
