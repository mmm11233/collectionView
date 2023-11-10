//
//  Movie.swift
//  collectionView
//
//  Created by Mariam Joglidze on 03.11.23.
//

import UIKit

class Movie {
    let image: UIImage
    let title: String
    let genre: String
    let rating: Double
    
    init(image: UIImage, title: String, genre: String, rating: Double) {
        self.image = image
        self.title = title
        self.genre = genre
        self.rating = rating
    }
    
    static let dummyData = [
        Movie(image: UIImage(named: "Cover")!,
              title: "The Batman",
              genre: "Action",
              rating: 8.1
             ),
        Movie(image: UIImage(named: "unc")!,
              title: "Uncharted",
              genre: "adventure",
              rating: 7.9
             ),
        Movie(image:  UIImage(named:"the ex")!,
              title: "The Exorcism of God",
              genre: "Horror",
              rating: 5.6
             ),
        Movie(image:  UIImage(named: "turn")!,
              title: "Turning Red",
              genre: "Comedy",
              rating: 7.1
             ),
        Movie(image:  UIImage(named:"spide")!,
              title: "Spider-Man: No Way Home",
              genre: "Action",
              rating: 8.1
             ),
        Movie(image:  UIImage(named: "morb")!,
              title: "Morbius",
              genre: "Action",
              rating: 5.3
             ),
    ]
}
