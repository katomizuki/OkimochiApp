
import UIKit

class LetterContentController: UIViewController {

    @IBOutlet weak var contentTextView: UITextView!
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = 15
            nextButton.layer.masksToBounds = true
        }
    }
    @IBOutlet weak var titleTextFiled: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func didTapNextButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PostLetter", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LetterTimeController") as! LetterTimeController
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
