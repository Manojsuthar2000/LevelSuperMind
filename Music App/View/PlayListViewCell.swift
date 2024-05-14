import UIKit

class PlayListViewCell: UICollectionViewCell {
    
    lazy var image = {
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
        imageView.layer.borderWidth = 2
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.gray.cgColor
        imageView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        return imageView
    }()
    
    lazy var musicLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Music"
        label.textColor = .systemTeal
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    lazy var titleLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "For Creativity"
        label.textColor = .white
        return label
    }()
    
    lazy var songsXPLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12 songs . 100XP"
        label.textColor = .white
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private func setSubview() {
        contentView.addSubview(image)
        contentView.addSubview(musicLabel)
        contentView.addSubview(titleLabel)
        contentView.addSubview(songsXPLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.heightAnchor.constraint(equalTo: image.widthAnchor),
            
            musicLabel.topAnchor.constraint(equalTo: image.bottomAnchor),
            musicLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            musicLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            musicLabel.heightAnchor.constraint(equalToConstant: 14),
            
            titleLabel.topAnchor.constraint(equalTo: musicLabel.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 32),
            
            songsXPLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            songsXPLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            songsXPLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            songsXPLabel.heightAnchor.constraint(equalToConstant: 14)
        ])
    }
    
    func changeConstraints() {
        titleLabel.topAnchor.constraint(equalTo: musicLabel.bottomAnchor).isActive = false
        titleLabel.topAnchor.constraint(equalTo: image.bottomAnchor).isActive = true
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14).isActive = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .black
        setSubview()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
