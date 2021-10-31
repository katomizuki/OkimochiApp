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
    override func awakeFromNib() {
        super.awakeFromNib()
        let nib = ProfileOptionsCell.nib()
        profileOptionsCollectionView.register(nib, forCellWithReuseIdentifier: ProfileOptionsCell.id)
        profileOptionsCollectionView.delegate = self
        profileOptionsCollectionView.dataSource = self
    }
}
// MARK: - CollectionDelegate
extension ProfileFilter: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
    }
}
// MARK: - CollectionDataSource
extension ProfileFilter: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(#function)
        return ProfileFilterOptions.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileOptionsCell.id, for: indexPath) as! ProfileOptionsCell
        cell.optionsLabel.text = ProfileFilterOptions(rawValue: indexPath.row)?.description
        cell.backgroundColor = .systemPink
        print(indexPath.row)
        return cell
    }
    
    
}
// MARK: - CollectionFlowLayout
extension ProfileFilter: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 3, height: frame.height)
    }
}
