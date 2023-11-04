//
//  ViewController.swift
//  collectionView
//
//  Created by Mariam Joglidze on 03.11.23.
//

import UIKit

class HomeViewController: UIViewController{
    
    // MARK: - Properties
    let mainStackview: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.axis = .vertical
        
        return stackview
    }()
    
    private let headerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 8
        return stackView
    }()
    
    private let moviesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(hexStringExtension: "#1A2232")
        
        return collectionView
    }()
    
    var movies = Movie.dummyData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hexStringExtension: "#1F293D")
        setupNavigationBar()
        setupUI()
    }
    
    // MARK: - Private Methods
    private func setupNavigationBar() {
        let image = UIImage(named: "Product Logo")
        let leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(setupLogoButtonAction))
        navigationItem.setLeftBarButton(leftBarButtonItem, animated: true)
        leftBarButtonItem.tintColor = .orange
        
        let button = UIButton(type: .custom)
        button.setTitle("Profile", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor(hexString: "#FF8036")
        button.layer.cornerRadius = 8
        button.frame = CGRect(x: 0, y: 0, width: 77, height: 40)
        let rightBarButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    @objc func setupLogoButtonAction() {
        
    }
    
    func setupUI() {
        setupStackView()
        setupCollectionView()
    }
    
    private func setupStackView()  {
        view.addSubview(mainStackview)
        mainStackview.backgroundColor = UIColor(hexString: "#1A2232")
        
        NSLayoutConstraint.activate([
            mainStackview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            mainStackview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),
            mainStackview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
    
    func setupCollectionView() {
        moviesCollectionView.delegate = self
        moviesCollectionView.dataSource = self
        moviesCollectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "HomeCollectionViewCell")
        let headerView = createHeaderView()
        moviesCollectionView.collectionViewLayout.invalidateLayout()
        
        mainStackview.addArrangedSubview(headerView)
        
        mainStackview.addArrangedSubview(moviesCollectionView)
        moviesCollectionView.reloadData()
    }
    
    func createHeaderView() -> UIView {
          let headerView = UIView()
          headerView.backgroundColor = .clear

          let titleLabel = UILabel()
          titleLabel.text = "Now in cinemas"
          titleLabel.textColor = .white
          titleLabel.font = UIFont.boldSystemFont(ofSize: 24)

          headerView.addSubview(titleLabel)

          titleLabel.translatesAutoresizingMaskIntoConstraints = false
          NSLayoutConstraint.activate([
              titleLabel.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10),
              titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 20),
              titleLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -20),
              titleLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10)
          ])
          return headerView
      }
}


extension UIColor {
    convenience init(hexStringExtension: String) {
        let hex = hexStringExtension.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
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






