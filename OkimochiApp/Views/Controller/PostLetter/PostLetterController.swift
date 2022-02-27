import UIKit

final class PostLetterController: UIViewController {
    // MARK: Properties
    @IBOutlet private weak var whoTypeTableView: UITableView!
    @IBOutlet private weak var nextButton: UIButton! {
        didSet {
            nextButton.layer.cornerRadius = 15
            nextButton.layer.masksToBounds = true
        }
    }
    var presentar: PostLetterPresentable?
    private let tableViewManager = PostDataTableViewManager()
    static let id = String(describing: PostLetterController.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backButtonDisplayMode = .minimal
        setupTableView()
    }
    private func setupTableView() {
        whoTypeTableView.delegate = tableViewManager
        whoTypeTableView.dataSource = tableViewManager
        whoTypeTableView.register(LetterWhoTypeCell.nib(), forCellReuseIdentifier: LetterWhoTypeCell.id)
        whoTypeTableView.rowHeight = 50
        whoTypeTableView.isScrollEnabled = false
        whoTypeTableView.allowsMultipleSelection = false
    }

    @IBAction private func didTapNextButton(_ sender: Any) {
        presentar?.onTapNextButton()
    }
}
extension PostLetterController: PostLetterViewable {
    func completedPostLetter() {
        // 手紙投稿の完了
    }

    func showError() {
        // エラー処理
    }
}
