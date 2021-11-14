
import UIKit

class LetterContentController: UIViewController {

    // MARK: - Properties
    @IBOutlet weak var contentTextView: UITextView! {
        didSet {
            contentTextView.layer.cornerRadius = 15
            contentTextView.layer.masksToBounds = true
            contentTextView.layer.borderColor = UIColor.lightGray.cgColor
            contentTextView.layer.borderWidth = 2
        }
    }
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = 15
            nextButton.layer.masksToBounds = true
        }
    }
    private let placeholderText:UILabel = {
        let label = UILabel()
        label.text = "ここに内容を入力してください"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    @IBOutlet weak var titleTextFiled: UITextField! {
        didSet {
            titleTextFiled.layer.cornerRadius = 15
            titleTextFiled.layer.masksToBounds = true
            titleTextFiled.layer.borderColor = UIColor.lightGray.cgColor
            titleTextFiled.layer.borderWidth = 2
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonDisplayMode = .minimal
        setupPlaceholder()
    }
    private func setupPlaceholder() {
        contentTextView.addSubview(placeholderText)
        placeholderText.anchor(top:contentTextView.topAnchor,left: contentTextView.leftAnchor,paddingTop: 5,paddingLeft: 10)
        NotificationCenter.default.addObserver(self, selector: #selector(didChangeTextView), name: UITextView.textDidChangeNotification, object: nil)
    }
    
    @IBAction func didTapNextButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PostLetter", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LetterTimeController") as! LetterTimeController
        navigationController?.pushViewController(controller, animated: true)
    }
    @objc private func didChangeTextView() {
        placeholderText.isHidden = contentTextView.text.count > 0
    }
}
