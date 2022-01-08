//
//  PostDataSource.swift
//  OkimochiApp
//
//  Created by ミズキ on 2022/01/08.
//

import UIKit
 class PostDataTableViewManager: NSObject,UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SendWhoType.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LetterWhoTypeCell.id, for: indexPath) as? LetterWhoTypeCell else { fatalError() }
        cell.whoType = SendWhoType(rawValue: indexPath.row)
        return cell
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let cell = tableView.cellForRow(at: indexPath) as! LetterWhoTypeCell
         if indexPath.row == 1 {

         } else {
             cell.accessoryType =  .checkmark
     }
 }
     func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
         let cell = tableView.cellForRow(at: indexPath)
         cell?.accessoryType = .none
     }
}
