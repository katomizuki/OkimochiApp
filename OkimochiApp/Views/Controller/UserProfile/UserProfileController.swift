import UIKit
class UserProfileController: UIViewController {
    static let id = String(describing: self)
    private var viewModel:ProfileViewData?
    var presentar:UserProfilePresentable?
    var user:User? {
        didSet {
            profileCollectionView.reloadData()
        }
    }
    @IBOutlet weak var profileCollectionView: UICollectionView!
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
        profileCollectionView.dataSource = self
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
//        do {
//            try Auth.auth().signOut()
//            let vc = tabBarController?.viewControllers?[0]
//            tabBarController?.selectedViewController = vc
//        } catch {
//            print(error)
//        }
    }
}

// MARK: - collectionViewDelegate
extension UserProfileController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
        let storyboard = UIStoryboard(name: "UserProfile", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LetterDetailController") as! LetterDetailController
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
}
// MARK: - colledtionViewDataSource
extension UserProfileController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCell.id, for: indexPath) as? ProfileCell else { fatalError() }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ProfileHeader.id, for: indexPath) as? ProfileHeader else { fatalError() }
        header.delegate = self
        if let user = user {
            header.viewModel = ProfileHeaderViewData(user: user)
        }
        return header
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
extension UserProfileController: ProfileHeaderDelegate {
    func didTapUpdateButton() {
        print(#function)
        presentar?.onTapUpdateButton()
    }
    
    func didTapProfileOptionsButton(_ selectOptions: ProfileFilterOptions) {
        print(#function)
        switch selectOptions {
        case .fav:
            print("fav")
        case .past:
            print("past")
        case .info:
            print("info")
            
        }
    }
}
extension UserProfileController:UserProfileViewable {
   
}
