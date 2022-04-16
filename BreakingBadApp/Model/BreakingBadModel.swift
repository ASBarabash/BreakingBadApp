//
//  BreakingBadModel.swift
//  BreakingBadApp
//
//  Created by Alexandr Barabash on 16.04.2022.
//

import Foundation

struct BreakingBad: Codable {
    
    let name: String
    let img: String
    let nickname: String
    let portrayed: String
    let occupation: [String]
    
    init(value: [String: Any]) {
        name = value["name"] as? String ?? ""
        img = value["img"] as? String ?? ""
        nickname = value["nickname"] as? String ?? ""
        portrayed = value["portrayed"] as? String ?? ""
        occupation = value["occupation"] as? [String] ?? []
        
    }
    
    static func getPeoplesBreakingBad(from value: Any) -> [BreakingBad] {
        guard let value = value as? [[String : Any]] else { return [] }
        return value.compactMap { BreakingBad(value: $0)}
    }
    
  
}
