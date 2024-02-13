//
//  BeerService.swift
//  Beer_Search_Text
//
//  Created by jointree on 2024/02/08.
//

import Foundation
import Moya

enum BeerService {
    case getBeers
    case getSingleBeer(id: String)
    case getRandomBeer
}

extension BeerService: TargetType {
    public var baseURL: URL {
        return URL(string: "https://api.punkapi.com/v2")!
    }
    
    var path: String {
        switch self {
        case .getBeers:
            return "/beers"
        case .getSingleBeer(let id):
            return "/beers/\(id)"
        case .getRandomBeer:
            return "/beers/random"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getBeers, .getSingleBeer, .getRandomBeer:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getBeers, .getRandomBeer:
            return .requestPlain
        case .getSingleBeer(let id):
            return .requestParameters(parameters: ["ids" : id], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
