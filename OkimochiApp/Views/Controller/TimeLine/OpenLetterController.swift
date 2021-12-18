
import UIKit

class OpenLetterController: UIViewController {
    static let id = String(describing: self)
    var presentar:OpenLetterPresentable?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
}
extension OpenLetterController:OpenLetterViewable {
    
}
