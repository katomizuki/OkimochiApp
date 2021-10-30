import Foundation
enum SendWhoType: Int {
    case me
    case you
    case all
}
struct Letter {
    var title: String
    var text: String
    var isOpen = true
    var sendType: SendWhoType?
    var placeName: String
}
