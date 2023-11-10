//
//  WebServiceManager.swift
//  collectionView
//
//  Created by Mariam Joglidze on 10.11.23.
//

import Foundation

protocol WebServiceManaging {
    func httpGet(url: URL, completion: @escaping ((MovieResponse, Error?) -> Void))
    func httpGet(url: URL, completion: @escaping (Result<MovieResponse, Error>) -> Void)
    
    func httpGet<T: Decodable>(url: URL, completion: @escaping ((Result<T, Error>) -> Void))
    func httpPost<T: Decodable>(url: URL, completion: @escaping ((T, Error) -> Void))
}

final class WebServiceManger: WebServiceManaging {
    func httpGet(url: URL, completion: @escaping ((MovieResponse, Error?) -> Void)) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(decoded, error)
            } catch {
                print(error)
            }
        }
        .resume()
    }
    
    func httpGet(url: URL, completion: @escaping (Result<MovieResponse, Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(MovieResponse.self, from: data)
                completion(.success(decoded))
            } catch {
                print(error)
                completion(.failure(error))
            }
        }
        .resume()
    }
    
    func httpGet<T: Decodable>(url: URL, completion: @escaping ((Result<T, Error>) -> Void)) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            
            do {
                let decoded = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decoded))
            } catch {
                completion(.failure(error))
            }
        }
        .resume()
    }
    
    func httpPost<T: Decodable>(url: URL, completion: @escaping ((T, Error) -> Void)) {
        
    }
}
