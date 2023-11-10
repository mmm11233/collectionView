//
//  MovieResponse.swift
//  collectionView
//
//  Created by Mariam Joglidze on 10.11.23.
//

import Foundation
struct MovieResponse: Decodable {
    
    let results: [MovieResults]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
}
