import RealmSwift
import Foundation

class LetterObject: Object {
    @objc dynamic var text: String = ""
    @objc dynamic var latitude:String = ""
    @objc dynamic var longitude:String = ""
    @objc dynamic var userName:String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var placeName: String = ""
    @objc dynamic var isOpen:Bool = false
}
