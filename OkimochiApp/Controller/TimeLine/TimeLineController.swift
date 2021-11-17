import UIKit
import FirebaseAuth
import MapKit
//import GoogleMaps
import CoreLocation
class TimeLineController: UIViewController {
    // MARK: - Properties
    var user:User?
    private let collectionCell = "collectionCell"
    @IBOutlet weak var collectionView: UICollectionView!
    private let locationManager = CLLocationManager()
    private lazy var mapView:MKMapView = {
        let bounds = UIScreen.main.bounds.size
        let frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
        let mapView = MKMapView(frame: frame)
        mapView.center = CGPoint(x:self.view.frame.width/2,y:self.view.frame.height/2)
        return mapView
    }()
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mapView)
        view.sendSubviewToBack(mapView)
        setupCollectionView()
        checkLogin()
        checkLocationAndAddPin()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "LoginController", sender: nil)
            }
        }
    }
    // MARK: - SetupMethod
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionCell)
        collectionView.collectionViewLayout = layout
    }
    // MARK: - checkMethod
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
    private func checkLocationAndAddPin() {
        locationManager.delegate = self
        mapView.userTrackingMode = .followWithHeading
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
// MARK: - CLLocationManagerDelegate
extension TimeLineController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            let latitude = $0.coordinate.latitude
            let longitude =  $0.coordinate.longitude
            let center = CLLocationCoordinate2D(latitude: latitude,
                                                longitude: longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.01,
                                        longitudeDelta: 0.01)
            let region = MKCoordinateRegion(center: center, span: span)
            mapView.setRegion(region, animated: true)
            mapView.setCenter(mapView.userLocation.coordinate, animated: true)
            
        }
    }
    func locationManager(_ manager: CLLocationManager,didChangeAuthorization status: CLAuthorizationStatus) {
             switch status {
             case .notDetermined:
                 manager.requestWhenInUseAuthorization()
             case .restricted, .denied:
                 break
             case .authorizedAlways, .authorizedWhenInUse:
                 manager.startUpdatingLocation()
                 break
             default:
                 break
             }
         }
}
// MARK: - MKMapViewDelegate
