import Foundation
import UIKit

class CustomSegue:UIStoryboardSegue {
    
    override func perform() {
        scale()
    }
    func scale() {
        let toVC = self.destination
        let fromVC = self.source
        let containerView = fromVC.view.superview
        let originalCenter = fromVC.view.center
        toVC.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        toVC.view.center = originalCenter
        containerView?.addSubview(toVC.view)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            toVC.view.transform = CGAffineTransform.identity
        } completion: { result in
            toVC.modalPresentationStyle = .fullScreen
            fromVC.present(toVC, animated: false, completion: nil)
            print(#function)
        }
    }
}


