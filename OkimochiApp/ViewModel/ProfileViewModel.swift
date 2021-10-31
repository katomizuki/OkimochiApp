import Foundation
//列挙型,CaseIterable プロトコル
enum ProfileFilterOptions :Int,CaseIterable {
    case fav
    case past
    case info
    var description: String {
        switch self {
        case .fav: return "お気に入り"
        case .past: return "過去閲覧"
        case .info: return "基本情報"
        }
    }
}
