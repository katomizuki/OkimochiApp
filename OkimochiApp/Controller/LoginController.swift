
import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            let leftView = UIView()
            let imageView = UIImageView()
            leftView.setDimensions(height: 40, width: 40)
            emailTextField.leftView = leftView
            emailTextField.leftViewMode = .always
            let image = UIImage(systemName: "mail.fill")
            imageView.image = image
            imageView.tintColor = .systemOrange
            leftView.addSubview(imageView)
            imageView.setDimensions(height: 40, width: 40)
        }
    }
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            let imageView = UIImageView()
            let leftView = UIView()
            leftView.setDimensions(height: 40, width: 40)
            passwordTextField.leftView = leftView
            passwordTextField.leftViewMode = .always
            let image = UIImage(systemName: "lock.fill")
            imageView.image = image
            imageView.tintColor = .systemOrange
            leftView.addSubview(imageView)
            imageView.setDimensions(height: 40, width: 40)

        }
    }
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var gotoRegisterButton: UIButton! {
        didSet {
            let attibutedString = NSMutableAttributedString(string: "まだアカウントを持ってない方はこちらへ\n",
                                                     attributes: [.font : UIFont.systemFont(ofSize: 14),.foregroundColor:UIColor.systemGray])
            attibutedString.append(NSAttributedString(string: "新規登録ページへ",
                                                      attributes: [.font : UIFont.boldSystemFont(ofSize: 14),.foregroundColor:UIColor.systemGray]))
            gotoRegisterButton.setAttributedTitle(attibutedString, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func didTapLoginButton(_ sender: Any) {
        print(#function)
    }
    @IBAction func gotoRegister(_ sender: Any) {
        print(#function)
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        print(storyboard)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegisterController") as! RegisterController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

