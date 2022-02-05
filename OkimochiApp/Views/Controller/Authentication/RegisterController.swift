import UIKit

final class RegisterController: UIViewController {
    @IBOutlet weak var imageButton: UIButton!
    static let id = String(describing: RegisterController.self)
    // MARK: - Properties
    @IBOutlet private weak var mailTextField: UITextField! {
        didSet {
            updateLeftView(mailTextField, imagename: "mail.fill")
        }
    }
    @IBOutlet private weak var passwordTextField: UITextField! {
        didSet {
            updateLeftView(passwordTextField, imagename: "lock.fill")
        }
    }
    @IBOutlet private weak var nameTextField: UITextField! {
        didSet {
            updateLeftView(nameTextField, imagename: "person.fill")
        }
    }
    @IBOutlet private weak var gotoRegisterButton: UIButton! {
        didSet {
            let attibutedString = updateAuthAttibutedString(explain: "既にアカウントを持っている方はこちらへ" ,
                                                            pageName: "ログイン画面へ")
            gotoRegisterButton.setAttributedTitle(attibutedString, for: .normal)
        }
    }
    @IBOutlet private weak var registerButton: UIButton! {
        didSet {
            registerButton.layer.cornerRadius = 10
            registerButton.layer.masksToBounds = true
        }
    }
    private var viewData = RegisterViewData()
    var presentar: RegisterPresentable?
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    // MARK: - SetupMethod
    private func setupUI() {
        navigationController?.navigationBar.isHidden = true
        mailTextField.delegate = self
        passwordTextField.delegate = self
        nameTextField.delegate = self
        imageButton.clipsToBounds = true
        imageButton.layer.cornerRadius = 50
    }
    // MARK: - IBAction
    @IBAction private func gotoLogin(_ sender: Any) {
        print(#function)
        presentar?.onTapGotoLoginButton()
    }

    @IBAction func didTapImageButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        present(picker, animated: true, completion: nil)
    }
    @IBAction func didTapRegisterButton(_ sender: Any) {
        print(#function)
        guard let email = mailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let name = nameTextField.text else { return }
        //        guard let image = viewData.image else { return }
        let credential = Credential(name: name, email: email, password: password)
        presentar?.onTapRegisterButton(credential: credential)
    }

}
// MARK: - TextFieldDelegate
extension RegisterController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case mailTextField: viewData.email = textField.text
        case passwordTextField: viewData.password = textField.text
        case nameTextField: viewData.name = textField.text
        default:break
        }
        registerButton.isEnabled = viewData.isValid
        registerButton.backgroundColor = viewData.isValid ? .systemOrange : .systemGray
        return true
    }
}
extension RegisterController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        imageButton.setImage(image, for: .normal)
        viewData.image = image
        dismiss(animated: true, completion: nil)
    }
}
extension RegisterController: RegisterViewable {
    func showError() {
        // エラー処理
    }
}
