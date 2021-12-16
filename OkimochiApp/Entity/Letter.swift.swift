import Foundation
enum SendWhoType: Int,CaseIterable,Codable {
    case me
    case you
    case all
    var description:String {
        switch self {
        case .me: return "自分に送る"
        case .you: return "友だちに送る"
        case .all: return "全員に送る"
        }
    }
}
struct Letter:Codable {
    var title: String
    var text: String
    var isOpen = true
    var sendType: SendWhoType?
    var placeName: String
}
