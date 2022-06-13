//
//  NetworkManagerImage.swift
//  BreakingBadApp
//
//  Created by Alexandr Barabash on 13.06.2022.
//
import Foundation
import UIKit


class NetworkManagerImage {
    
    static let shared = NetworkManagerImage()
    
    let linkForImage = "https://api.dujin.org/pic/fengjing"
    private init() {}
    
    
    func getImage(completion: @escaping (Result<Data, Error>) -> (Void)) {
        guard let url = URL(string: linkForImage) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else { return }
            DispatchQueue.main.async {
                completion(.success(data))
            }
        }.resume()
        
    }
}



