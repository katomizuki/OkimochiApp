import Foundation
import UIKit
class ProfileFilter:UIView {
    
    
    @IBOutlet weak var profileOptionsCollectionView: UICollectionView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    func configure() {
        let nib = UINib(nibName: "ProfileFilter", bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
        addSubview(view)
    }
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
}
