import UIKit

final class LetterDetailController: UIViewController {

    static let id = String(describing: LetterDetailController.self)
    var presentar: LetterDetailPresentable?

    override func viewDidLoad() {
        super.viewDidLoad()
        presentar?.viewDidLoad()
    }

}
extension LetterDetailController: LetterDetailViewable {
    func showError() {
        // エラー処理
    }

    func completeUpdate() {
        // 手紙の更新完了
    }

    func setLetterViewData(_ viewData: LetterDetailViewData) {
        // viewdataで更新
    }
}
