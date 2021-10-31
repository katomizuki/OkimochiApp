import Foundation
//列挙型,CaseIterable プロトコル
enum ProfileFilterOptions :Int,CaseIterable {
    case fav
    case past
    case info
    var description: String{
        switch self {
        case .fav: return "お気に入りレター"
        case .past: return "過去閲覧した手紙"
        case .info: return "基本情報"
        }
    }
}
