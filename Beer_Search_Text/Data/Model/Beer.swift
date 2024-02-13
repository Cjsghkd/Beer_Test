//
//  Beer.swift
//  Beer_Search_Text
//
//  Created by jointree on 2024/02/08.
//

import Foundation

struct Beer: Codable, Identifiable {
    let id: Int
    let name, tagline, first_brewed, description, image_url: String
    let abv: Double
    let target_fg: Int
    let ebc: Int?
    let target_og, attenuation_level: Double
    let ibu, srm, ph: Double?
    let volume, boil_volume: BoilVolume
    let method: Method?
    let ingredients: Ingredients
    let food_paring: [String]?
    let brewers_tips, contributed_by: String
    
//    enum CodingKeys: String, CodingKeys {
//        case id, name, tagline, description, abv, ibu, ebc, srm, ph, volume, method, ingredients
//        case firstBrewed = "first_brewed"
//        case imageURL = "image_url"
//        case targetFg = "target_fg"
//        case targetOg = "target_og"
//        case attenuationLevel = "attenuation_level"
//        case boilVolume = "boil_volume"
//        case foodParing = "food_paring"
//        case brewersTips = "brewers_tips"
//        case contributedBy = "contributed_by"
//    }
}

struct BoilVolume: Codable {
    let value: Double
    let unit: String
}

struct Method: Codable {
    let mash_temp: [MashTemp]?
    let fermentation: Fermentation
    let twist: String?
}

struct MashTemp: Codable {
    let temp: BoilVolume
    let duration: Int?
}

struct Fermentation: Codable {
    let temp: BoilVolume
}

struct Ingredients: Codable {
    let malt: [Malt]
    let hops: [Hop]
    let yeast: String
}

struct Malt: Codable {
    let name: String
    let amount: BoilVolume
}

struct Hop: Codable {
    let name: String
    let amount: BoilVolume
    let add, attribute: String
}
