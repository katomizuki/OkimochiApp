import UIKit

class FinishLetterController: UIViewController {
    // MARK: - Properties
    @IBOutlet private var letterImageView: UIImageView!
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        shakeLetter()
    }
    // MARK: -  IBAction
    @IBAction func didTapfinishButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    func shakeLetter() {
        print(#function)
       let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [0, 20, -20, 20, 0]
        animation.keyTimes = [0, 0.16, 0.5, 0.83, 1]
        animation.duration = 0.5
        animation.isAdditive = true
        letterImageView.layer.add(animation, forKey: "shake")
    }

    
}

