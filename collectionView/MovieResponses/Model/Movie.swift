//
//  Movie.swift
//  collectionView
//
//  Created by Mariam Joglidze on 03.11.23.
//
import Foundation

struct MovieResults: Decodable{
    let title: String
    let language: String
    let rate: Double
    let image: String
    let overview: String
    let voteCount: Int
    let popularity: Double
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case title = "original_title"
        case language = "original_language"
        case rate = "vote_average"
        case image = "poster_path"
        case overview = "overview"
        case voteCount = "vote_count"
        case popularity = "popularity"
        case id = "id"
          
    }
}
