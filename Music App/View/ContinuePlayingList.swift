import UIKit

protocol ContinuePlayingListDelegate {
    func playListItemDidGetSelected(_ heading: String)
}

class ContinuePlayingList: UITableViewCell {
    
    var delegate: ContinuePlayingListDelegate?
    var section: Section?
    
    private lazy var playList = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        let playList = UICollectionView(frame: .zero, collectionViewLayout: layout)
        playList.translatesAutoresizingMaskIntoConstraints = false
        playList.showsHorizontalScrollIndicator = false
        playList.backgroundColor = .black
        playList.register(PlayListViewCell.self, forCellWithReuseIdentifier: "PlayListCell")
        playList.dataSource = self
        playList.delegate = self
        return playList
    }()
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            playList.topAnchor.constraint(equalTo: contentView.topAnchor),
            playList.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            playList.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            playList.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(playList)
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ContinuePlayingList: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.section!.playList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayListCell", for: indexPath) as! PlayListViewCell
        cell.titleLabel.text = section?.playList[indexPath.row]
        if section!.header == "Music Playlists" {
            cell.image.layer.borderWidth = 0
            cell.musicLabel.isHidden = true
            playList.backgroundColor = .clear
            backgroundView = UIImageView(image: .musicPlaylistBackground)
            cell.contentView.backgroundColor = UIColor.backColor2
            cell.contentView.layer.cornerRadius = 25
            cell.contentView.layer.masksToBounds = true
            cell.titleLabel.font = .systemFont(ofSize: 14)
            cell.songsXPLabel.font = .systemFont(ofSize: 10)
            cell.changeConstraints()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.section!.weight, height: self.section!.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.playListItemDidGetSelected(section!.playList[indexPath.row])
    }
}
