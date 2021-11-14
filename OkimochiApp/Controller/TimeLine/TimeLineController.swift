import UIKit
import FirebaseAuth
class TimeLineController: UIViewController {
    var user:User?
    private let collectionCell = "collectionCell"
    @IBOutlet weak var mapView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        checkLogin()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "LoginController", sender: nil)
            }
        }
    }
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionCell)
        collectionView.collectionViewLayout = layout
    }
    private func checkLogin() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "LoginController", sender: nil)
            }
        } else {
            guard let uid = Auth.auth().currentUser?.uid else { return }
            UserService.fetchUser(uid: uid) { user in
                self.user = user
            }
        }
    }
    
}
// MARK: - CollectionViewDelegate
extension TimeLineController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
    }
}
// MARK: - CollectionViewDataSource
extension TimeLineController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCell, for: indexPath)
        cell.backgroundColor = .systemOrange
        return cell
    }
}
// MARK: - CollectionViewDelegateFlowlayout
extension TimeLineController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 60)
    }
}
