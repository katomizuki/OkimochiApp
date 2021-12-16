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

struct ProfileViewData {
    let options: ProfileFilterOptions
    let user:User
    let letter:Letter
    init(user: User,options:ProfileFilterOptions,letter:Letter) {
        self.user = user
        self.options = options
        self.letter = letter
    }
}
