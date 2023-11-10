//
//  DetailsViewController.swift
//  collectionView
//
//  Created by Mariam Joglidze on 03.11.23.
//

import UIKit

class DetailsViewController: UIViewController {
    private var imageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let firstStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private let secondStackView: UIStackView = {
        let secondStackView = UIStackView()
        secondStackView.translatesAutoresizingMaskIntoConstraints = false
        secondStackView.axis = .vertical
        secondStackView.alignment = .fill
        secondStackView.distribution = .fill
        secondStackView.spacing = 16
        secondStackView.backgroundColor = .white
        return secondStackView
    }()
    
    private let thirdStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let fourthStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let fifthStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let sixthStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let sevenththStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let eighthStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let selectSeason: UIButton =  {
        let button = UIButton()
        return button
    }()
    
 var movieResponse: MovieResults?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexString: "#1A2232")
        
        setUpNavBar()
        setupUI()
    }
    
    func setupUI() {
        setupImageStackView()
        setupfirstStackView()
        setupSecondStackView()
        setupThirdStackView()
        setupFourthStackView()
        setupfifthStackView()
        setupSixththStackView()
        setupSeventhStackView()
        setupEighthStackView()
        setupSelectSeason()
    }
    
    func setUpNavBar() {
        title = "Movies Detail"
    }
    
    func setupImageStackView() {
        view.addSubview(imageStackView)
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            imageStackView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            imageStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            imageStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            imageStackView.heightAnchor.constraint(equalToConstant: 210)
        ])
        
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        imageStackView.addArrangedSubview(imageView)
        loadImageForMovie(movieResponse!) {(image) in
            imageView.image = image
            
        }
        
    }
    
    func loadImageForMovie(_ movie: MovieResults, completion: @escaping (UIImage?) -> Void) {
        let imageUrlString = "https://image.tmdb.org/t/p/w342/\(movie.image)"
        guard let imageUrl = URL(string: imageUrlString) else {
            completion(nil)
            return
        }
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: imageUrl)) {
            let data = cachedResponse.data
            let image = UIImage(data: data)
            completion(image)
        } else {
            URLSession.shared.dataTask(with: URLRequest(url: imageUrl)) { (data, response, error) in
                if let data = data {
                    let cachedResponse = CachedURLResponse(response: response!, data: data)
                    URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: imageUrl))
                    
                    let image = UIImage(data: data)
                    completion(image)
                } else {
                    completion(nil)
                }
            }.resume()
        }
    }

    func setupfirstStackView() {
        view.addSubview(firstStackView)
        
        NSLayoutConstraint.activate([
            firstStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            firstStackView.topAnchor.constraint(equalTo: imageStackView.bottomAnchor),
            firstStackView.heightAnchor.constraint(equalToConstant: 33)
        ])
        
        let ratingLabel = UILabel()
        ratingLabel.text = "\(String(describing: movieResponse?.rate))"
        ratingLabel.textColor = .white
        firstStackView.addArrangedSubview(ratingLabel)

        let imdbLabel = UILabel()
        imdbLabel.text = "IMDB"
        imdbLabel.textColor = .white
        imdbLabel.font = imdbLabel.font.withSize(14)
        firstStackView.addArrangedSubview(imdbLabel)
    }
    
    func setupSecondStackView() {
        view.addSubview(secondStackView)
        secondStackView.backgroundColor = UIColor(hexString: "#1A2232")
        
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            secondStackView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 0),
            secondStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            secondStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = movieResponse?.overview
        label.numberOfLines = 0
        label.font = label.font.withSize(14)
        label.textColor = .white
        
        secondStackView.addArrangedSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: secondStackView.topAnchor, constant: 16),
            label.leadingAnchor.constraint(equalTo: secondStackView.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: secondStackView.trailingAnchor, constant: -16),
            label.bottomAnchor.constraint(equalTo: secondStackView.bottomAnchor, constant: 16)
        ])
    }
    
    func setupThirdStackView() {
        view.addSubview(thirdStackView)
    
        NSLayoutConstraint.activate([
            thirdStackView.topAnchor.constraint(equalTo: secondStackView.bottomAnchor, constant: 12),
            thirdStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            thirdStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        let CertificateLabel = UILabel()
        CertificateLabel.text = "Certificate"
        CertificateLabel.textColor = .white
        CertificateLabel.font = CertificateLabel.font.withSize(14)
        thirdStackView.addArrangedSubview(CertificateLabel)
        
        let ageLabel = UILabel()
        ageLabel.text = "\(String(describing: movieResponse!.rate))"
        ageLabel.font = ageLabel.font.withSize(14)
        
        ageLabel.textColor = .white
        thirdStackView.addArrangedSubview(ageLabel)
    }
    
    func setupFourthStackView() {
        view.addSubview(fourthStackView)
        
        NSLayoutConstraint.activate([
            fourthStackView.topAnchor.constraint(equalTo: thirdStackView.bottomAnchor, constant: 12),
            fourthStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            fourthStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        let runTime = UILabel()
        runTime.text = "Runtime"
        runTime.textColor = .white
        runTime.font = runTime.font.withSize(14)
        fourthStackView.addArrangedSubview(runTime)

        let time = UILabel()
        time.text = "\(String(describing: movieResponse!.popularity))"
        time.textColor = .white
        time.font = time.font.withSize(14)
        fourthStackView.addArrangedSubview(time)
    }
    
    func setupfifthStackView() {
        view.addSubview(fifthStackView)
        
        NSLayoutConstraint.activate([
            fifthStackView.topAnchor.constraint(equalTo: fourthStackView.bottomAnchor, constant: 12),
            fifthStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            fifthStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        let release = UILabel()
        release.text = "Release"
        release.font = release.font.withSize(14)
        release.textColor = .white
        fifthStackView.addArrangedSubview(release)
        
        let releaseDate = UILabel()
        releaseDate.text = movieResponse?.title
        releaseDate.font = releaseDate.font.withSize(14)
        releaseDate.textColor = .white
        fifthStackView.addArrangedSubview(releaseDate)
    }
    
    func setupSixththStackView() {
        view.addSubview(sixthStackView)
        
        NSLayoutConstraint.activate([
            sixthStackView.topAnchor.constraint(equalTo: fifthStackView.bottomAnchor, constant: 12),
            sixthStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sixthStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        let genre = UILabel()
        genre.text = "Genre"
        genre.font = genre.font.withSize(14)
        genre.textColor = .white
        sixthStackView.addArrangedSubview(genre)
        
        let variousGenre = UILabel()
        variousGenre.text = movieResponse?.language
        variousGenre.textColor = .white
        variousGenre.font = variousGenre.font.withSize(14)
        sixthStackView.addArrangedSubview(variousGenre)
    }
    
    func setupSeventhStackView() {
        view.addSubview(sevenththStackView)
        
        NSLayoutConstraint.activate([
            sevenththStackView.topAnchor.constraint(equalTo: sixthStackView.bottomAnchor, constant: 12),
            sevenththStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            sevenththStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        let director = UILabel()
        director.text = "Director"
        director.textColor = .white
        director.font = director.font.withSize(14)
        sevenththStackView.addArrangedSubview(director)
        
        let directorName = UILabel()
        directorName.text = "\(String(describing: movieResponse!.voteCount))"
        directorName.textColor = .white
        directorName.font = directorName.font.withSize(14)
        sevenththStackView.addArrangedSubview(directorName)
    }
    
    func setupEighthStackView() {
        view.addSubview(eighthStackView)
        
        NSLayoutConstraint.activate([
            eighthStackView.topAnchor.constraint(equalTo: sevenththStackView.bottomAnchor, constant: 12),
            eighthStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            eighthStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
        ])
        
        let cast = UILabel()
        cast.text = "Cast"
        cast.textColor = .white
        cast.font = cast.font.withSize(14)
        eighthStackView.addArrangedSubview(cast)
        
        let castName = UILabel()
        castName.text = movieResponse?.title
        castName.numberOfLines = 0
        castName.font = castName.font.withSize(14)
        castName.textColor = .white
        
        eighthStackView.addArrangedSubview(castName)
    }
    
    func setupSelectSeason() {
        selectSeason.setTitle("Selected Season", for: .normal)
        selectSeason.backgroundColor = UIColor(hexString: "#FF8036")
        selectSeason.layer.cornerRadius = 23
        view.addSubview(selectSeason)
        
        selectSeason.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            selectSeason.topAnchor.constraint(equalTo: eighthStackView.bottomAnchor, constant: 16),
            selectSeason.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            selectSeason.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            selectSeason.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}


extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}




