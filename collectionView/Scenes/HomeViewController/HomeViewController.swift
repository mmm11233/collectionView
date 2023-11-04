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
        collectionView.backgroundColor = .white
        
        return collectionView
    }()
    
     var movies = Movie.dummyData
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        button.backgroundColor = UIColor.orange
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
        mainStackview.backgroundColor = .white
        
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
        mainStackview.addArrangedSubview(moviesCollectionView)
    }
}





    
   


