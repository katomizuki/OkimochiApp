
import UIKit

class LoginController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }

    @IBAction func gotoRegister(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Auth", bundle: nil)
        print(storyboard)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegisterController") as! RegisterController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

