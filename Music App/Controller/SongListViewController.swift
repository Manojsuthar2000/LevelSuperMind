import UIKit

class SongListViewController: UITableViewController {
    
    let playList = PlayList()
    var Heading: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.rowHeight = 100
        let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
        headerView.titleLable.text = Heading
        headerView.search.isHidden = true
        headerView.stackView.isHidden = true
        headerView.delegate = self
        tableView.tableHeaderView = headerView
        tableView.backgroundColor = .black
        tableView.register(SongListViewCell.self, forCellReuseIdentifier: "SongListCell")
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playList.SongList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongListCell", for: indexPath) as! SongListViewCell
        cell.titleLable.text = playList.SongList[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newVC = MusicPlayerVC()
        newVC.modalPresentationStyle = .fullScreen
        present(newVC, animated: true, completion: nil)
    }
}

extension SongListViewController: HeaderViewDelegate {
    
    func backButtonIsPressed() {
        self.dismiss(animated: true, completion: nil)
    }
}
