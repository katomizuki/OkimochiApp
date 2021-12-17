import UIKit
import MapKit
//import GoogleMaps
import CoreLocation
class TimeLineController: UIViewController,TimeLineViewable{
    // MARK: - Properties
    var user:User?
    private let collectionCell = "collectionCell"
    @IBOutlet weak var collectionView: UICollectionView!
    private let locationManager = CLLocationManager()
    var mapView:MKMapView!
    var presentar:TimeLinePresentar?
    static let id = String(describing: self)
  
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let bounds = UIScreen.main.bounds.size
        let frame = CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height)
        mapView = MKMapView(frame: frame)
        mapView.center = CGPoint(x:self.view.frame.width/2,y:self.view.frame.height/2)
        view.addSubview(mapView)
        view.sendSubviewToBack(mapView)
        setupCollectionView()
        checkLogin()
        checkLocationAndAddPin()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    init(presentar:TimeLinePresentar) {
        self.presentar = presentar
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        guard let token = UserDefaultsRepositry.shared.getToken() else { return }
//        UserService.getUser(token: token) { result in
//            switch result {
//            case .success(let user):
//                self.user = user
//            case .failure:
//                DispatchQueue.main.async {
//                    self.performSegue(withIdentifier: "LoginController", sender: nil)
//                }
//            }
//        }
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
}
// MARK: - CollectionViewDelegate
extension TimeLineController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
        performSegue(withIdentifier: "OpenLetterController", sender: nil)
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
