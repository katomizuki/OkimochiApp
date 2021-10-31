import Foundation
import UIKit
class ProfileFilter:UIView {
    
    @IBOutlet weak var profileOptionsCollectionView: UICollectionView!
    private let underLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemOrange
        return view
    }()
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
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profileOptionsCollectionView.delegate = self
        profileOptionsCollectionView.dataSource = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        profileOptionsCollectionView.collectionViewLayout = layout
        let nib = ProfileOptionsCell.nib()
        profileOptionsCollectionView.register(nib, forCellWithReuseIdentifier: ProfileOptionsCell.id)
        addSubview(underLineView)
        let width = UIScreen.main.bounds.width
        underLineView.anchor(left:leftAnchor,
                             bottom:bottomAnchor,
                             width: width / 3,
                             height: 2)
    }
}
// MARK: - CollectionDelegate
extension ProfileFilter: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function,"✋")
        let cell = collectionView.cellForItem(at: indexPath)
        guard let x = cell?.frame.origin.x else { return }
        UIView.animate(withDuration: 0.3) {
            self.frame.origin.x = x
        }
    }
}
// MARK: - CollectionDataSource
extension ProfileFilter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProfileFilterOptions.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileOptionsCell.id, for: indexPath) as! ProfileOptionsCell
        let option = ProfileFilterOptions(rawValue: indexPath.row)
        cell.options = option
        cell.backgroundColor = .red
        return cell
    }
}
// MARK: - UICollectionViewDelegateFlowLayout
extension ProfileFilter: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.size.width
        let count = CGFloat(ProfileFilterOptions.allCases.count)
        return CGSize(width: width / count, height: frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

