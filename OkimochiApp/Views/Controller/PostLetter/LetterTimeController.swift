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
    static let id = String(describing: self)
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonDisplayMode = .minimal
    }
  
    @IBAction private func didTapNextButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PostLetter", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LetterMapController") as! LetterMapController
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
extension LetterTimeController:LetterTimeViewable {
    
}
