//
//  HomeViewController+CollectionView.swift
//  collectionView
//
//  Created by Mariam Joglidze on 03.11.23.
//

import UIKit

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        let movie = movies[indexPath.row]
        cell.genreLabel.text = movie.genre
        cell.image.image = movie.image
        cell.titleLabel.text = movie.title
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        let detailsViewController = DetailsViewController()
        detailsViewController.movie = movie
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

//not work, but why?
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.frame.width - 15) / 2
        let cellHeight: CGFloat = 273
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        15
    }
    
}



