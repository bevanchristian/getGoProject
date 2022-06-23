//
//  Character.swift
//  getGoProject
//
//  Created by bevan christian on 20/06/22.
//

import Foundation



struct Character: Codable {
    var info: Info?
    var results: [charResult]?
}

struct Info: Codable  {
    var count, pages: Int?
    var next: String?
}

struct charResult: Codable, Identifiable, Equatable  {
    static func == (lhs: charResult, rhs: charResult) -> Bool {
        return lhs.name == rhs.name && lhs.status == rhs.status && lhs.species == rhs.species && lhs.gender == rhs.gender && lhs.image == rhs.image
    }
    
    var id: Int?
    var name, status, species, type: String?
    var gender: String?
    var origin, location: Location?
    var image: String?
    var episode: [String]?
    var url: String?
    var created: String?
}

// MARK: - Location
struct Location: Codable  {
    var name: String?
    var url: String?
}



