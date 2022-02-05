import Foundation
import UIKit
enum SendWhoType: Int, CaseIterable, Codable {
    case me
    case you
    case all
    var description: String {
        switch self {
        case .me: return "自分に送る"
        case .you: return "友だちに送る"
        case .all: return "全員に送る"
        }
    }
}
struct Letter: Codable {
    var title: String
    var text: String
    var isOpen: Int
    var sendType: SendWhoType?
    var who: String
    var imageUrl: String
    var openTime: String
    var openPlaceName: String
    var latitude: Double
    var longitude: Double
    //    var letterImage:UIImage?
    var imageData: Data?
}
