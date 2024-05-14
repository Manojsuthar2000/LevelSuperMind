import UIKit

class TrendingHeadingCell: UITableViewCell {
    
    private lazy var backView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.songCellBG
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
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var titleLable = {
        let label = UILabel()
        label.text = "For Focus"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var playButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage.playIcon, for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return button
    }()
    
    private lazy var timeXPLabel = {
        let label = UILabel()
        label.text = "\(arc4random_uniform(13)) mins . 10 XP"
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    private lazy var verticalStackView = {
        let verticalStackView = UIStackView(arrangedSubviews: [titleLable, timeXPLabel])
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
        backView.addSubview(playButton)
    }
    
    private func constraints() {
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: contentView.topAnchor),
            backView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            backView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            backView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            image.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            image.leadingAnchor.constraint(equalTo: backView.leadingAnchor, constant: 20),
            image.widthAnchor.constraint(equalTo: backView.heightAnchor, constant: -20),
            image.bottomAnchor.constraint(equalTo: backView.bottomAnchor, constant: -10),
            
            verticalStackView.topAnchor.constraint(equalTo: backView.topAnchor, constant: 10),
            verticalStackView.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10),
            verticalStackView.heightAnchor.constraint(equalToConstant: 50),
            
            playButton.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            playButton.leadingAnchor.constraint(equalTo: verticalStackView.trailingAnchor, constant: 10),
            playButton.widthAnchor.constraint(equalToConstant: 40),
            playButton.heightAnchor.constraint(equalToConstant: 40),
            playButton.trailingAnchor.constraint(equalTo: backView.trailingAnchor, constant: -20)
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
