import UIKit

class PostLetterController: UIViewController {
 
    @IBOutlet weak var whoTypeTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupTableView()
    }
    private func setupTableView() {
        whoTypeTableView.delegate = self
        whoTypeTableView.dataSource = self
        let nib = LetterWhoTypeCell.nib()
        whoTypeTableView.register(nib, forCellReuseIdentifier: LetterWhoTypeCell.id)
        whoTypeTableView.rowHeight = 33
        whoTypeTableView.isScrollEnabled = false
        whoTypeTableView.allowsMultipleSelection = false
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
