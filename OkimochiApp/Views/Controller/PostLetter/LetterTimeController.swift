import UIKit

final class LetterTimeController: UIViewController {
    @IBOutlet private weak var postTimePicker: UIDatePicker! {
        didSet {
            postTimePicker.locale = Locale(identifier: "ja_JP")
        }
    }
    @IBOutlet private weak var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = 15
            nextButton.layer.masksToBounds = true
        }
    }
    static let id = String(describing: LetterTimeController.self)
    var presentar:LetterTimePresentable?
    override func viewDidLoad() {
        super.viewDidLoad()
        presentar?.viewDidLoad()
        navigationItem.backButtonDisplayMode = .minimal
    }
  
    @IBAction private func didTapNextButton(_ sender: Any) {
        presentar?.onTapNextButton()
    }
    
}
extension LetterTimeController:LetterTimeViewable {
    
}
