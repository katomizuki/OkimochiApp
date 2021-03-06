import UIKit

final class UserProfileController: UIViewController {
    static let id = String(describing: UserProfileController.self)
    private var viewData: ProfileViewData?
    var presentar: UserProfilePresentable?
    var user: User? {
        didSet {
            guard let user = user else { return }
            collectionViewManager.initViewData(ProfileHeaderViewData(user: user))
            profileCollectionView.reloadData()
        }
    }
    @IBOutlet private weak var profileCollectionView: UICollectionView!
    private let collectionViewManager = UserProfileCollectionViewManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(didTapSearchButton))
        setupCollectionView()
        navigationItem.rightBarButtonItem?.tintColor = .systemOrange
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "ログアウト", style: .done, target: self, action: #selector(didTapLogoutButton))
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presentar?.viewWillAppear()
    }
    // MARK: - SetupMethod
    private func setupCollectionView() {
        let cellNib = ProfileCell.nib()
        profileCollectionView.register(cellNib, forCellWithReuseIdentifier: ProfileCell.id)
        profileCollectionView.delegate = collectionViewManager
        profileCollectionView.dataSource = collectionViewManager
        collectionViewManager.delegate = self
        let headerNib = ProfileHeader.nib()
        profileCollectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileHeader.id)
    }
    @objc private func didTapSearchButton() {
        presentar?.onTapSearchButton()

    }
    @objc private func didTapLogoutButton() {
        presentar?.onTapLogoutButton()
    }
}

// MARK: - ProfileHeaderDelegate
extension UserProfileController: UserProfileCollectionViewManagerDelegate {
    func onTapLetterDetail() {
        presentar?.onTapLetterDetail()
    }
    func onTapUpdateButton() {
        presentar?.onTapUpdateButton()
    }

    func onTapProfileOptionsButton(_ selectOptions: ProfileFilterOptions) {
        presentar?.onTapOptionsButton(selectOptions)
    }
}
extension UserProfileController: UserProfileViewable {

    func setViewData(_ viewData: ProfileHeaderViewData) {
        collectionViewManager.initViewData(viewData)
    }

    func setLetterViewData(_ viewData: UserLetterViewData) {
        collectionViewManager.initUserLetterViewData(viewData)
    }

    func showError() {
        present(AlertProvider.makeCommonAlert(), animated: true)
    }
    func reload() {
        profileCollectionView.reloadData()
    }

    func setFriendViewData(_ viewData: UserFriendsViewData) {
        collectionViewManager.initFriendsViewData(viewData)
    }

}
