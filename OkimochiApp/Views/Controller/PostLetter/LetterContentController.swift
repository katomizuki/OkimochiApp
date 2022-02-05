import UIKit

final class LetterContentController: UIViewController {

    // MARK: - Properties
    @IBOutlet private weak var contentTextView: UITextView! {
        didSet {
            contentTextView.layer.cornerRadius = 15
            contentTextView.layer.masksToBounds = true
            contentTextView.layer.borderColor = UIColor.lightGray.cgColor
            contentTextView.layer.borderWidth = 2
        }
    }
    @IBOutlet private weak var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = 15
            nextButton.layer.masksToBounds = true
        }
    }
    private let placeholderText: UILabel = {
        let label = UILabel()
        label.text = "ここに内容を入力してください"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    @IBOutlet private weak var titleTextFiled: UITextField! {
        didSet {
            titleTextFiled.layer.cornerRadius = 15
            titleTextFiled.layer.masksToBounds = true
            titleTextFiled.layer.borderColor = UIColor.lightGray.cgColor
            titleTextFiled.layer.borderWidth = 2
        }
    }
    var presentar: LetterContentPresentable?
    static let id = String(describing: LetterContentController.self)
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonDisplayMode = .minimal
        setupPlaceholder()
        presentar?.viewDidLoad()
    }
    private func setupPlaceholder() {
        contentTextView.addSubview(placeholderText)
        placeholderText.anchor(top: contentTextView.topAnchor, left: contentTextView.leftAnchor, paddingTop: 5, paddingLeft: 10)
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeTextView), name: UITextView.textDidChangeNotification, object: nil)
    }

    @IBAction private func didTapNextButton(_ sender: Any) {
        presentar?.onTapNextButton()
    }
    @objc private func didChangeTextView() {
        placeholderText.isHidden = contentTextView.text.count > 0
    }
}
extension LetterContentController: LetterContentViewable {
    func showError() {

    }

}
