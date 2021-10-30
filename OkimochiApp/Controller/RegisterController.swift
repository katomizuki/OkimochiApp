
import UIKit

class RegisterController: UIViewController {

    
    @IBOutlet weak var mailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var gotoRegisterButton: UIButton! {
        didSet {
            let attibutedText = NSMutableAttributedString(string: "既にアカウントを持っている方はこちらへ\n", attributes: [.font:UIFont.systemFont(ofSize: 14),.foregroundColor:UIColor.systemGray])
            attibutedText.append(NSAttributedString(string: "ログイン画面へ", attributes: [.font: UIFont.boldSystemFont(ofSize: 14),.foregroundColor:UIColor.systemGray]))
            gotoRegisterButton.setAttributedTitle(attibutedText, for: .normal)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    @IBAction func gotoLogin(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
}
