import UIKit

class PostLetterController: UIViewController,PostLetterViewable {
    // MARK: Properties
    @IBOutlet private weak var whoTypeTableView: UITableView!
    @IBOutlet private weak var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = 15
            nextButton.layer.masksToBounds = true
        }
    }
    var presentar:PostLetterPresentar?
    static let id = String(describing: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonDisplayMode = .minimal
        
        setupTableView()
    }
    private func setupTableView() {
        whoTypeTableView.delegate = self
        whoTypeTableView.dataSource = self
        let nib = LetterWhoTypeCell.nib()
        whoTypeTableView.register(nib, forCellReuseIdentifier: LetterWhoTypeCell.id)
        whoTypeTableView.rowHeight = 50
        whoTypeTableView.isScrollEnabled = false
        whoTypeTableView.allowsMultipleSelection = false
    }

    @IBAction private func didTapNextButton(_ sender: Any) {
        let storyboard = UIStoryboard(name: "PostLetter", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "LetterContentController") as! LetterContentController
        navigationController?.pushViewController(controller, animated: true)
    }
}
// MARK: - UITableViewDelegate
extension PostLetterController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        let cell = tableView.cellForRow(at: indexPath) as! LetterWhoTypeCell
        if indexPath.row == 1 {
            performSegue(withIdentifier: "LetterFriendController", sender: nil)
        } else {
            cell.accessoryType =  .checkmark
    }
}
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
    }
}
// MARK: - UITableViewDataSource
extension PostLetterController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SendWhoType.allCases.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LetterWhoTypeCell.id, for: indexPath) as? LetterWhoTypeCell else { fatalError() }
        cell.whoType = SendWhoType(rawValue: indexPath.row)
        return cell
    }
}
