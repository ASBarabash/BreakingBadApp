//
//  NetworManagerBreakingBad.swift
//  BreakingBadApp
//
//  Created by Alexandr Barabash on 16.04.2022.
//

import Foundation
import Alamofire

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

let link = "https://www.breakingbadapi.com/api/character/random"

class NetworkManagerBreakingBad {
    
    static let shared = NetworkManagerBreakingBad()
    
    private init () {}
    
    func fetchBreakingBad(_ completion: @escaping (Result<[BreakingBad], NetworkError>) -> (Void)) {
        AF.request(link)
            .validate()
            .responseJSON { dataResponse in
                switch dataResponse.result {
                case .success(let value):
                    let peoples = BreakingBad.getPeoplesBreakingBad(from: value)
                    completion(.success(peoples))
                case .failure(let error):
                    print(error)
                    completion(.failure(.decodingError))
                }
            }
    }
}
