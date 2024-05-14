import UIKit
import AVFoundation

class MusicPlayerVC: UIViewController {
    
    var timeObserver: Any?
    
    private lazy var backButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage.backButton, for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(popView(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var image = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(resource: .musicPlayerBackground)
        return imageView
    }()

    private lazy var titleLable = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
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
    
    private lazy var shareButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage.shareIcon, for: .normal)
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return button
    }()

    private lazy var slider = {
        let playbackSlider = UISlider()
        playbackSlider.translatesAutoresizingMaskIntoConstraints = false
        playbackSlider.tintColor = .blue
        playbackSlider.isContinuous = true
        playbackSlider.minimumValue = 0
        playbackSlider.value = 0
        playbackSlider.addTarget(self, action: #selector(playbackSliderValueChanged(_:event:)), for: .valueChanged)
        return playbackSlider
    }()
    
    private lazy var startLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "00:00"
        label.textColor = .white
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var stopLabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = stringFromCMTime(playerItemDuration())
        label.textColor = .white
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var playButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage.playCircle, for: .normal)
        button.addTarget(self, action: #selector(playSound(sender: )), for: .touchUpInside)
        return button
    }()
    

    private func setViews() {
        view.addSubview(image)
        view.addSubview(backButton)
        view.addSubview(titleLable)
        view.addSubview(shareButton)
        view.addSubview(downloadButton)
        view.addSubview(favoriteButton)
        view.addSubview(slider)
        view.addSubview(startLabel)
        view.addSubview(stopLabel)
        view.addSubview(playButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            backButton.widthAnchor.constraint(equalToConstant: 30),
            backButton.heightAnchor.constraint(equalToConstant: 30),
            
            image.topAnchor.constraint(equalTo: view.topAnchor),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            titleLable.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 30),
            titleLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            shareButton.leadingAnchor.constraint(equalTo: titleLable.trailingAnchor, constant: 10),
            shareButton.centerYAnchor.constraint(equalTo: titleLable.centerYAnchor),
            shareButton.widthAnchor.constraint(equalToConstant: 20),
            shareButton.heightAnchor.constraint(equalToConstant: 20),
            
            downloadButton.leadingAnchor.constraint(equalTo: shareButton.trailingAnchor, constant: 10),
            downloadButton.centerYAnchor.constraint(equalTo: titleLable.centerYAnchor),
            downloadButton.widthAnchor.constraint(equalToConstant: 20),
            downloadButton.heightAnchor.constraint(equalToConstant: 20),
            
            favoriteButton.leadingAnchor.constraint(equalTo: downloadButton.trailingAnchor, constant: 10),
            favoriteButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            favoriteButton.widthAnchor.constraint(equalToConstant: 20),
            favoriteButton.heightAnchor.constraint(equalToConstant: 20),
            favoriteButton.centerYAnchor.constraint(equalTo: titleLable.centerYAnchor),
            
            slider.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 30),
            slider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            slider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            startLabel.topAnchor.constraint(equalTo: slider.bottomAnchor, constant: 10),
            startLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            stopLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            stopLabel.centerYAnchor.constraint(equalTo: startLabel.centerYAnchor),
            
            playButton.topAnchor.constraint(equalTo: startLabel.bottomAnchor, constant: 30),
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.widthAnchor.constraint(equalToConstant: 40),
            playButton.heightAnchor.constraint(equalToConstant: 40),
            playButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
        ])
    }
    
    private func stringFromCMTime(_ time: CMTime) -> String {
        if CMTIME_IS_INVALID(time) {
            return "00:00"
        }
        let ti = Int(time.seconds)
        let seconds = ti % 60
        let minutes = (ti / 60) % 60
        return String(format: "%0.2d:%0.2d",minutes,seconds)
    }
    
    private lazy var player = {
        let url = Bundle.main.url(forResource: "raag-pilu-mix-full-vers", withExtension: "mp3")!
        let avPlayerItem = AVPlayerItem(url: url)
        let player = AVPlayer(playerItem: avPlayerItem)
        player.play()
        playButton.setImage(UIImage.stopIcon, for: .normal)
        return player
    }()
    
    func sliderSetup() {
        DispatchQueue.global(qos: .background).async {
            let duration : CMTime = self.player.currentItem!.duration
            let seconds : Float64 = CMTimeGetSeconds(duration)
            DispatchQueue.main.async {
                self.slider.maximumValue = Float(seconds)
            }
        }
    }
    
    func timeObserverSetup() {
        let interval = CMTime(seconds: 0.05, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        timeObserver = player.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main, using: { [weak self] elapsedTime in
            self!.updateSlider(elapsedTime: elapsedTime)
        })
    }
    
    func updateSlider(elapsedTime: CMTime) {
        let playerDuration = playerItemDuration()
        if CMTIME_IS_INVALID(playerDuration) {
            slider.minimumValue = 0.0
            return
        }
        let duration = Float(CMTimeGetSeconds(playerDuration))
        if duration.isFinite && duration > 0 {
            slider.minimumValue = 0.0
            slider.maximumValue = duration
            let time = Float(CMTimeGetSeconds(elapsedTime))
            slider.setValue(time, animated: true)
            startLabel.text = stringFromCMTime(elapsedTime)
            stopLabel.text = stringFromCMTime(playerDuration)
        }
    }

    
    private func playerItemDuration() -> CMTime {
        let thePlayerItem = player.currentItem
        if thePlayerItem?.status == .readyToPlay {
            return thePlayerItem!.duration
        }
        return CMTime.invalid
    }
    
    func removeTimerObserver() {
        if timeObserver != nil {
            if player.rate == 1.0 {
                player.removeTimeObserver(self.timeObserver as Any)
                timeObserver = nil
            }
        }
    }
    
    @objc func playSound(sender: UIButton) {
        if player.timeControlStatus == .playing {
            player.pause()
            playButton.setImage(UIImage.playCircle, for: .normal)
        } else {
            player.play()
            playButton.setImage(UIImage.stopIcon, for: .normal)
        }
    }
    
    @objc func playbackSliderValueChanged(_ playbackSlider:UISlider, event: UIEvent) {

            let seconds : Int64 = Int64(slider.value)
            let targetTime:CMTime = CMTimeMake(value: seconds, timescale: 1)
            player.seek(to: targetTime)
            
            if let touchEvent = event.allTouches?.first {
                switch touchEvent.phase {
                case .began:
                    removeTimerObserver()
                    player.pause()
                    playButton.setImage(UIImage.playCircle, for: .normal)
                    break
                    
                case .moved:
                    break
                    
                case .ended:
                    timeObserverSetup()
                    player.play()
                    playButton.setImage(UIImage.stopIcon, for: .normal)
                    break
                    
                default:
                    break
                }
            }
    }
    
    @objc func popView(_ sender: UIButton) {
        player.pause()
        removeTimerObserver()
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setConstraints()
        timeObserverSetup()
    }
}
