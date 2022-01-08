import UIKit

final class PostLetterController: UIViewController,PostLetterViewable {
    // MARK: Properties
    @IBOutlet private weak var whoTypeTableView: UITableView!
    @IBOutlet private weak var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = 15
            nextButton.layer.masksToBounds = true
        }
    }
    var presentar: PostLetterPresentable?
    private let dataSource = PostDataSource()
    static let id = String(describing: PostLetterController.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonDisplayMode = .minimal
        setupTableView()
    }
    private func setupTableView() {
        whoTypeTableView.delegate = self
        whoTypeTableView.dataSource = dataSource
        whoTypeTableView.register(LetterWhoTypeCell.nib(), forCellReuseIdentifier: LetterWhoTypeCell.id)
        whoTypeTableView.rowHeight = 50
        whoTypeTableView.isScrollEnabled = false
        whoTypeTableView.allowsMultipleSelection = false
    }

    @IBAction private func didTapNextButton(_ sender: Any) {
        presentar?.onTapNextButton()
    }

}
// MARK: - UITableViewDelegate
extension PostLetterController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        let cell = tableView.cellForRow(at: indexPath) as! LetterWhoTypeCell
        if indexPath.row == 1 {

        } else {
            cell.accessoryType =  .checkmark
    }
}
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .none
    }
}

