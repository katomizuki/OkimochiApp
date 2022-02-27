import UIKit

class OpenLetterController: UIViewController {
    static let id = String(describing: OpenLetterController.self)
    var presentar: OpenLetterPresentable?
    override func viewDidLoad() {
        super.viewDidLoad()
        presentar?.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
}
extension OpenLetterController: OpenLetterViewable {
    func showError() {
        // エラー処理
    }

    func completedOpenLetter() {

    }

    func setLetterViewData(_ viewData: OpenLetterViewData) {
        // ViewDataでUI更新処理
    }

}
