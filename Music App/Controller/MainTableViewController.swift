import UIKit

class MainTableViewController: UITableViewController {
    
    let sections = Sections()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        let headerView = HeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
        headerView.playButton.isHidden = true
        tableView.tableHeaderView = headerView
        self.tableView.register(ContinuePlayingList.self, forCellReuseIdentifier: "continuePlayingList")
        self.tableView.register(RecommendedCell.self, forCellReuseIdentifier: "recommendedCell")
        tableView.register(TrendingListCell.self, forCellReuseIdentifier: "TrendingListCell")
        tableView.register(TrendingHeadingCell.self, forCellReuseIdentifier: "TrendingHeadingCell")
    }
    
    // tableView
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.sectionList.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.sectionList[section].rowCount
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 3 && indexPath.row == 0 {
            return 120
        }
        return sections.sectionList[indexPath.section].height
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            return tableView.dequeueReusableCell(withIdentifier: "recommendedCell", for: indexPath)
        } else if indexPath.section == 3 {
            if indexPath.row == 0 {
                return tableView.dequeueReusableCell(withIdentifier: "TrendingHeadingCell", for: indexPath)
            }
            let cell = tableView.dequeueReusableCell(withIdentifier: "TrendingListCell", for: indexPath) as! TrendingListCell
            cell.titleLable.text = sections.sectionList[3].playList[indexPath.row]
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "continuePlayingList", for: indexPath) as! ContinuePlayingList
        cell.delegate = self
        cell.section = sections.sectionList[indexPath.section]
        return cell
    }
    
    // headerView
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections.sectionList[section].header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sections.headerHeight
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.textLabel?.textColor = .white
            headerView.textLabel?.font = .systemFont(ofSize: 18)
        }
    }
}

extension MainTableViewController: ContinuePlayingListDelegate {
    
    func playListItemDidGetSelected(_ heading: String) {
        let newVC = SongListViewController()
        newVC.modalPresentationStyle = .fullScreen
        newVC.Heading = heading
        present(newVC, animated: true, completion: nil)
    }
}

