//
//  CountryInfo.swift
//  CoronaTrack
//
//  Created by Pranav Karthik on 2020-03-15.
//  Copyright © 2020 Pranav Karthik. All rights reserved.
//

import Foundation


struct Countries: Decodable {
    private enum CodingKeys : String, CodingKey { case data = "data"}
    let data: [CountryData]
}

struct CountryData: Codable, Hashable {
    
    var location: String
    var confirmed: Int
    var deaths: Int
    var recovered: Int
    
}

struct Country {
    var name: String
    var confirmed: Int
    var deaths: Int
    var recovered: Int
    var saved: Bool
}


//struct CountryInfo: Identifiable {
//
//}
