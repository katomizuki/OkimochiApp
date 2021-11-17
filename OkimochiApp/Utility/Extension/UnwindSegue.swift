import Foundation
import UIKit

class UnwindSegue:UIStoryboardSegue {
    override func perform() {
        scale()
    }
    func scale() {
        print("ss")
        let toVC = self.destination
        let fromVC = self.source
        fromVC.view.superview?.insertSubview(toVC.view, at: 0)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            fromVC.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        } completion: { result in
            fromVC.dismiss(animated: true, completion: nil)
        }
    }
}
