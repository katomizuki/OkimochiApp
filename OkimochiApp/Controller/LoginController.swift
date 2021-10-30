import UIKit

class LoginController: UIViewController {
    // MARK: - Properties
    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            updateLeftView(emailTextField, imagename: "mail.fill")
        }
    }
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            updateLeftView(passwordTextField, imagename: "lock.fill")
        }
    }
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var gotoRegisterButton: UIButton! {
        didSet {
            let attibutedString = updateAuthAttibutedString(explain:"まだアカウントを持ってない方はこちらへ" ,
                                          pageName: "新規登録ページへ")
            gotoRegisterButton.setAttributedTitle(attibutedString, for: .normal)
        }
    }
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - IBAction
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
// MARK: - TextFieldDelegate
extension LoginController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case emailTextField: print(textField.text)
        case passwordTextField: print(textField.text)
        default:break
        }
        return true
    }
}
