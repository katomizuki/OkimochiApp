import UIKit
import MapKit
//import GoogleMaps
import CoreLocation
class TimeLineController: UIViewController {
    // MARK: - Properties
    var user:User?
    private let collectionCell = "collectionCell"
    @IBOutlet weak var collectionView: UICollectionView!
    private let locationManager = CLLocationManager()
    var mapView:MKMapView!
    var presentar:TimeLinePresentable?
    static let id = String(describing: TimeLineController.self)
    private let collectionViewController = TimeLineCollectionViewController()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        setupCollectionView()
        checkLogin()
        checkLocationAndAddPin()
    }
    private func setupMapView() {
        let bounds = UIScreen.main.bounds.size
        let frame = CGRect(x: 0,
                           y: 0,
                           width: bounds.width,
                           height: bounds.height)
        mapView = MKMapView(frame: frame)
        mapView.center = CGPoint(x: self.view.frame.width / 2,
                                 y: self.view.frame.height / 2)
        view.addSubview(mapView)
        view.sendSubviewToBack(mapView)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presentar?.viewWillAppear()
    }
    
    // MARK: - SetupMethod
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.delegate = collectionViewController
        collectionView.dataSource = collectionViewController
        collectionViewController.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionCell)
        collectionView.collectionViewLayout = layout
    }
    // MARK: - checkMethod
    private func checkLogin() {
        presentar?.notToken()
    }
    private func checkLocationAndAddPin() {
        locationManager.delegate = self
        mapView.userTrackingMode = .followWithHeading
    }
    override func unwind(for unwindSegue: UIStoryboardSegue, towards subsequentVC: UIViewController) {
        print(#function)
    }
    @IBAction func prepareForUnwind(unwindSegue :UIStoryboardSegue) {
        print(#function)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(#function)
        if segue.identifier == OpenLetterController.id {
            presentar?.segue(segue: segue)
        }
    }
}
// MARK: - CollectionViewDelegate
extension TimeLineController: TimeLineDataSourceDelegate {
    func tapCell() {
        presentar?.onTapLetter()
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
extension TimeLineController: TimeLineViewable {
    func reload() {
        collectionView.reloadData()
    }
    
    func showError() {
        
    }
    func setLetters(_ letters: [Letter]) {
        collectionViewController.initViewData(letters)
    }
}
