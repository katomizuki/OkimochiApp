
import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var imageButton: UIButton!
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
            let attibutedString = updateAuthAttibutedString(explain:"既にアカウントを持っている方はこちらへ" ,
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
    private var viewModel = RegisterViewModel()
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
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func didTapImageButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        picker.allowsEditing = false
        present(picker, animated: true, completion: nil)
    }
}
// MARK: - TextFieldDelegate
extension RegisterController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case mailTextField: viewModel.email = textField.text
        case passwordTextField: viewModel.password = textField.text
        case nameTextField: viewModel.name = textField.text
        default:break
        }
        registerButton.isEnabled = viewModel.isValid
        registerButton.backgroundColor = viewModel.isValid ? .systemOrange : .systemGray
        return true
    }
}
extension RegisterController:UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.originalImage] as? UIImage else { return }
        imageButton.setImage(image, for: .normal)
        dismiss(animated: true, completion: nil)
    }
}
