import UIKit

class SongListViewCell: UITableViewCell {

    private lazy var backView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.songCellBG
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layer.borderWidth = 2
        return view
    }()
    
    private lazy var image = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        switch arc4random_uniform(3) {
        case 0:
            imageView.image = UIImage(resource: .staticSquareIcon)
        case 1:
            imageView.image = UIImage(resource: .albumImage2)
        default:
            imageView.image = UIImage(resource: .albumImage3)
        }
        return imageView
    }()
    
    lazy var titleLable = {
        let label = UILabel()
        label.text = "Enjoy Your Space"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var downloadButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage.download, for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return button
    }()
    
    private lazy var favoriteButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage.favorite, for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return button
    }()
    
    private lazy var playButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage.playCircle, for: .normal)
        return button
    }()
    
    private lazy var timeXPLabel = {
        let label = UILabel()
        label.text = "\(arc4random_uniform(13)) mins . 10 XP"
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var musicLabel = {
        let label = UILabel()
        label.text = "Music"
        label.textColor = .systemTeal
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var verticalStackView = {
        let verticalStackView = UIStackView(arrangedSubviews: [titleLable, timeXPLabel, musicLabel])
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 1
        verticalStackView.alignment = .leading
        verticalStackView.distribution = .fillProportionally
        return verticalStackView
    }()
    
    private func addView() {
        contentView.addSubview(backView)
        backView.addSubview(image)
        backView.addSubview(verticalStackView)
        backView.addSubview(downloadButton)
        backView.addSubview(favoriteButton)
        backView.addSubview(playButton)
    }
    
    private func constraints() {
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            image.topAnchor.constraint(equalTo: backView.topAnchor),
            image.leadingAnchor.constraint(equalTo: backView.leadingAnchor),
            image.widthAnchor.constraint(equalTo: backView.heightAnchor),
            image.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            
            verticalStackView.topAnchor.constraint(equalTo: backView.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            verticalStackView.bottomAnchor.constraint(equalTo: backView.bottomAnchor),
            
            downloadButton.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            downloadButton.leadingAnchor.constraint(equalTo: verticalStackView.trailingAnchor),
            downloadButton.widthAnchor.constraint(equalToConstant: 20),
            downloadButton.heightAnchor.constraint(equalToConstant: 20),
            
            favoriteButton.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            favoriteButton.leadingAnchor.constraint(equalTo: downloadButton.trailingAnchor, constant: 10),
            favoriteButton.widthAnchor.constraint(equalToConstant: 20),
            favoriteButton.heightAnchor.constraint(equalToConstant: 20),
            favoriteButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10),
            
            playButton.widthAnchor.constraint(equalToConstant: 30),
            playButton.heightAnchor.constraint(equalToConstant: 30),
            playButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -10),
            playButton.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -10)
        ])
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        addView()
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
