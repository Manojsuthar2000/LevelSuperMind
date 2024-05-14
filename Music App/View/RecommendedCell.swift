import UIKit

class RecommendedCell: UITableViewCell {
    
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
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        return imageView
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
        label.text = "Music.Spiritual Mantras"
        label.textColor = .systemTeal
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    lazy var titleLable = {
        let label = UILabel()
        label.text = "Om Chanting"
        label.textColor = .white
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    
    private lazy var verticalStackView = {
        let verticalStackView = UIStackView(arrangedSubviews: [musicLabel, titleLable, timeXPLabel])
        verticalStackView.translatesAutoresizingMaskIntoConstraints = false
        verticalStackView.axis = .vertical
        verticalStackView.spacing = 1
        verticalStackView.alignment = .leading
        verticalStackView.distribution = .fillProportionally
        return verticalStackView
    }()
    
    private func addView() {
        contentView.addSubview(image)
        contentView.addSubview(verticalStackView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            image.widthAnchor.constraint(equalTo: image.heightAnchor),
            
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            verticalStackView.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            verticalStackView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .black
        addView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
