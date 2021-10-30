
import UIKit

class RegisterController: UIViewController {

    
    @IBOutlet weak var mailTextField: UITextField! {
        didSet {
            updateLeftView(mailTextField, imagename: "mail.fill")
        }
    }
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            updateLeftView(passwordTextField, imagename: "lock.fill")
        }
    }
    @IBOutlet weak var nameTextField: UITextField! {
        didSet {
            updateLeftView(nameTextField, imagename: "person.fill")
        }
    }
    @IBOutlet weak var gotoRegisterButton: UIButton! {
        didSet {
            let attibutedString = updateAuthAttibutedString(explain:"既にアカウントを持っている方はこちらへ" ,
                                          pageName: "ログイン画面へ")
            gotoRegisterButton.setAttributedTitle(attibutedString, for: .normal)
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
