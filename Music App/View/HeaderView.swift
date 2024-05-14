import UIKit

protocol HeaderViewDelegate {
    func backButtonIsPressed()
}

class HeaderView: UIView {
    
    var delegate: HeaderViewDelegate?
    
    private lazy var backgroundImage = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = .topBanner
        return imageView
    }()
    
    private lazy var backButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage.backButton2, for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(popView(_:)), for: .touchUpInside)
        return button
    }()
    
    var titleLable = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Music"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()
    
    private lazy var downloadButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage.topDownloadIcon, for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return button
    }()
    
    private lazy var favoriteButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage.topFavoriteIcon, for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return button
    }()
    
    lazy var playButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage.playIcon2, for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return button
    }()
    
    lazy var search = {
        let search = UISearchBar()
        search.translatesAutoresizingMaskIntoConstraints = false
        search.layer.cornerRadius = 15
        search.layer.masksToBounds = true
        search.placeholder = "Search for music"
        return search
    }()
    
    lazy var stackView = {
        let button1 = UIButton()
        button1.setTitle("Free", for: .normal)
        button1.layer.cornerRadius = 15
        button1.layer.borderWidth = 2
        button1.layer.borderColor = UIColor.darkGray.cgColor
        button1.layer.masksToBounds = true
        button1.backgroundColor = .songCellBG
        
        let button2 = UIButton()
        button2.setTitle("For Study", for: .normal)
        button2.layer.cornerRadius = 15
        button2.layer.borderWidth = 2
        button2.layer.borderColor = UIColor.darkGray.cgColor
        button2.layer.masksToBounds = true
        button2.backgroundColor = .songCellBG
       
        let button3 = UIButton()
        button3.setTitle("For Work", for: .normal)
        button3.layer.cornerRadius = 15
        button3.layer.borderWidth = 2
        button3.layer.borderColor = UIColor.darkGray.cgColor
        button3.layer.masksToBounds = true
        button3.backgroundColor = .songCellBG
      
        let button4 = UIButton()
        button4.setTitle("For Focus", for: .normal)
        button4.layer.cornerRadius = 15
        button4.layer.borderWidth = 2
        button4.layer.borderColor = UIColor.darkGray.cgColor
        button4.layer.masksToBounds = true
        button4.backgroundColor = .songCellBG
      
        let stack = UIStackView(arrangedSubviews: [button1, button2, button3, button4])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.spacing = 10
        return stack
    }()
    
    private func setViews() {
        addSubview(backgroundImage)
        addSubview(backButton)
        addSubview(titleLable)
        addSubview(favoriteButton)
        addSubview(downloadButton)
        addSubview(search)
        addSubview(stackView)
        addSubview(playButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            
            titleLable.leadingAnchor.constraint(equalTo: backButton.trailingAnchor, constant: 10),
            titleLable.centerYAnchor.constraint(equalTo: backButton.centerYAnchor),
            
            favoriteButton.centerYAnchor.constraint(equalTo: titleLable.centerYAnchor),
            favoriteButton.widthAnchor.constraint(equalToConstant: 30),
            favoriteButton.heightAnchor.constraint(equalToConstant: 30),
            
            downloadButton.leadingAnchor.constraint(equalTo: favoriteButton.trailingAnchor, constant: 10),
            downloadButton.centerYAnchor.constraint(equalTo: titleLable.centerYAnchor),
            downloadButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            downloadButton.widthAnchor.constraint(equalToConstant: 30),
            downloadButton.heightAnchor.constraint(equalToConstant: 30),
            
            search.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 10),
            search.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            search.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            search.heightAnchor.constraint(equalToConstant: 30),
            
            stackView.topAnchor.constraint(equalTo: search.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            playButton.widthAnchor.constraint(equalToConstant: 60),
            playButton.heightAnchor.constraint(equalToConstant: 60),
            playButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            playButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    @objc func popView(_ sender: UIButton) {
        delegate?.backButtonIsPressed()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
