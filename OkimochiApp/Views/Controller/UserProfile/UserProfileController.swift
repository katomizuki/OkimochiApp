import UIKit
final class UserProfileController: UIViewController {
    static let id = String(describing: UserProfileController.self)
    private var viewModel:ProfileViewData?
    var presentar:UserProfilePresentable?
    var user:User? {
        didSet {
            guard let user = user else { return }
            dataSource.initViewData(ProfileHeaderViewData(user: user))
            profileCollectionView.reloadData()
        }
    }
    @IBOutlet weak var profileCollectionView: UICollectionView!
    private let dataSource = UserProfileDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearchButton))
        setupCollectionView()
        navigationItem.rightBarButtonItem?.tintColor = .systemOrange
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "ログアウト", style: .done, target: self, action: #selector(didTapLogoutButton))
        setupUserData()
    }
    // MARK: - SetupMethod
    private func setupCollectionView() {
        let cellNib = ProfileCell.nib()
        profileCollectionView.register(cellNib, forCellWithReuseIdentifier: ProfileCell.id)
        profileCollectionView.delegate = self
        profileCollectionView.dataSource = dataSource
        dataSource.delegate = self
        let headerNib = ProfileHeader.nib()
        profileCollectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileHeader.id)
    }
    private func setupUserData() {
   
    }
    @objc private func didTapSearchButton() {
        print(#function)
        presentar?.onTapSearchButton()
        
    }
    @objc private func didTapLogoutButton() {
        presentar?.onTapLogoutButton()
    }
}

// MARK: - collectionViewDelegate
extension UserProfileController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
        presentar?.onTapLetterDetail()
    }
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension UserProfileController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
}
// MARK: - ProfileHeaderDelegate
extension UserProfileController: UserProfileDataSourceDelegate {
    func onTapUpdateButton() {
        presentar?.onTapUpdateButton()
    }
    
    func onTapProfileOptionsButton(_ selectOptions: ProfileFilterOptions) {
//        presentar?.on
    }
    
    
}
extension UserProfileController:UserProfileViewable {
   
}
