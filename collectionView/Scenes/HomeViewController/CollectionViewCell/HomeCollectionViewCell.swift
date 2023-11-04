//
//  HomeCollectionViewCell.swift
//  collectionView
//
//  Created by Mariam Joglidze on 03.11.23.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    let image: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let genreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let heartButton: UIButton = {
        let heartButton = UIButton()
        heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        return heartButton
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupUI() {
        contentView.addSubview(image)
        image.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            image.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            image.heightAnchor.constraint(equalToConstant: 230)
        ])
        
        contentView.addSubview(titleLabel)
        titleLabel.font = UIFont(name: "Helvetica-Bold", size: 18)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ])
        
        contentView.addSubview(genreLabel)
        genreLabel.font = UIFont(name: "Helvetica", size: 16)
        genreLabel.textColor = .white
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            genreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            genreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 50),
            genreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ])
        
        contentView.addSubview(heartButton)
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            heartButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25),
            heartButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            heartButton.widthAnchor.constraint(equalToConstant: 30),
            heartButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        heartButton.clipsToBounds = true
        updateHeartButtonState()
        heartButton.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
    }
    
    @objc func heartButtonTapped() {
        heartButton.isSelected.toggle()
        updateHeartButtonState()
    }
    
    private func updateHeartButtonState() {
        if heartButton.isSelected {
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            heartButton.tintColor = .red
            
        } else {
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            heartButton.tintColor = .white
        }
    }
    
    
    
    
    
    
}
