import Foundation
import CoreImage

enum UpdateProfileSection:Int,CaseIterable {
    case name
    case gender
    case age
    case status
    case favLetterCount
    case postLetterCount
    var description: String {
        switch self {
        case .name: return "名前"
        case .gender: return "性別"
        case .age: return "年齢"
        case .status: return "ステータス"
        case .favLetterCount: return "保存した手紙数"
        case .postLetterCount: return "投かんした手紙数"
        }
    }
}

struct UpdateProfileViewData {
    private let user: User
    private let sections: UpdateProfileSection
    
    init(user: User,sectons:UpdateProfileSection) {
        self.user = user
        self.sections = sectons
    }
}
