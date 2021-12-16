import Foundation
import UIKit

struct FrinedCellViewData {
    
    var user:User
    var nameAttributedText:NSAttributedString {
        let attributedText:NSMutableAttributedString = NSMutableAttributedString(string: user.name, attributes: [.font:UIFont.boldSystemFont(ofSize: 16)])
        attributedText.append(NSAttributedString(string: " お手紙数　\(user.haveLetters.count) 枚", attributes: [.font:UIFont.systemFont(ofSize: 14),.foregroundColor:UIColor.lightGray]))
        return attributedText
    }
    init(user:User) {
        self.user = user
    }
}
