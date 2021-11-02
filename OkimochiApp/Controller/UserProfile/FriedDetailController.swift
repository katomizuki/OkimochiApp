import UIKit

class FriedDetailController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var friendImageView: UIImageView! {
        didSet {
            friendImageView.layer.cornerRadius = 75
            friendImageView.layer.masksToBounds = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func didTapDismissButton(_ sender: Any) {
        print(#function)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapPlusFrinedButton(_ sender: Any) {
        print(#function)
    }
    
  
}
