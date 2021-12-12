import Foundation
import RealmSwift

class UserObject: Object {
    @objc dynamic var userName:String = ""
    @objc dynamic var email:String = ""
    @objc dynamic var profileUrl:String = ""
    @objc dynamic var id:String = ""
    var letters = List<LetterObject>()
    override class func primaryKey() -> String? {
        return "id"
    }
}

