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
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.layer.cornerRadius = 10
            loginButton.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var gotoRegisterButton: UIButton! {
        didSet {
            let attibutedString = updateAuthAttibutedString(explain:"まだアカウントを持ってない方はこちらへ" ,
                                          pageName: "新規登録ページへ")
            gotoRegisterButton.setAttributedTitle(attibutedString, for: .normal)
        }
    }
    private var viewData = LoginViewData()
    static let id = String(describing: self)
    var presentar:LoginPresentable?
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    // MARK: - IBAction
    @IBAction func didTapLoginButton(_ sender: Any) {
        print(#function)
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        presentar?.onTapLoginButton()
    }
    @IBAction func gotoRegister(_ sender: Any) {
        print(#function)
        presentar?.onTapGotoRegisterButton()
    }
}
// MARK: - TextFieldDelegate
extension LoginController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case emailTextField: viewData.email = textField.text
        case passwordTextField: viewData.password = textField.text
        default:break
        }
        loginButton.isEnabled = viewData.isValid
        loginButton.backgroundColor = viewData.isValid ? .systemOrange : .systemGray
        return true
    }
}
extension LoginController:LoginViewable {
    
}
