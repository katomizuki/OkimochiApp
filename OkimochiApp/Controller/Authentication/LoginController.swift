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
    private var viewModel = LoginViewModel()
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    // MARK: - IBAction
    @IBAction func didTapLoginButton(_ sender: Any) {
        print(#function)
        guard let email = viewModel.email else { return }
        guard let password = viewModel.password else { return }
        AuthService.login(email: email, password: password) { result, error in
            if let error = error {
                print(error)
                return
            }
//            self.dismiss(animated: true, completion: nil)
        }
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
        case emailTextField: viewModel.email = textField.text
        case passwordTextField: viewModel.password = textField.text
        default:break
        }
        loginButton.isEnabled = viewModel.isValid
        loginButton.backgroundColor = viewModel.isValid ? .systemOrange : .systemGray
        return true
    }
}
