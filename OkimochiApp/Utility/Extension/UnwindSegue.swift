import Foundation
import UIKit
protocol UnwindSegueDelegate:AnyObject {
    func finishUnwind()
}
class UnwindSegue:UIStoryboardSegue {
    weak var segueDelegate:UnwindSegueDelegate?
    override func perform() {
        scale()
    }
    func scale() {
        let storyboard = UIStoryboard(name: "MainTab", bundle: nil)
        guard let tabController = storyboard.instantiateInitialViewController() as? UITabBarController else { return }
        let fromVC = self.source
        fromVC.view.superview?.insertSubview(tabController.view, at: 0)
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            fromVC.view.transform = CGAffineTransform(scaleX: 0.05, y: 0.05)
        } completion: { result in
            fromVC.dismiss(animated: false, completion: nil)
        }
    }
}
