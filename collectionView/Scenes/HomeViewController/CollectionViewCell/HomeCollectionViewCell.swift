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
        // Add the image with constraints
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
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ])
        
        // Add the genre label with constraints
        contentView.addSubview(genreLabel)
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            genreLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            genreLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            genreLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0)
        ])
        
        contentView.addSubview(heartButton)
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heartButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 25), // Adjust the top spacing as needed
            heartButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25), // Adjust the right spacing as needed
            heartButton.widthAnchor.constraint(equalToConstant: 30), // Adjust the width as needed
            heartButton.heightAnchor.constraint(equalToConstant: 30) // Adjust the height as needed
        ])
        heartButton.clipsToBounds = true
        //        heartButton.backgroundColor = .white
        updateHeartButtonState()
        heartButton.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
    }
    
    @objc func heartButtonTapped() {
        // Toggle the selected state of the button
        heartButton.isSelected.toggle()
        
        // Update the button's state when tapped
        updateHeartButtonState()
    }
    
    private func updateHeartButtonState() {
        if heartButton.isSelected {
            // Set the heart button's image for the selected state (e.g., red heart)
            heartButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            heartButton.tintColor = .red
        } else {
            // Set the heart button's image for the normal state (e.g., empty heart)
            heartButton.setImage(UIImage(systemName: "heart"), for: .normal)
            heartButton.tintColor = .white // Set the desired color for the normal state
        }
    }
    
    
    
    
    
    
}
