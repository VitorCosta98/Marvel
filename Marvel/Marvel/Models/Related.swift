//
//  Comics.swift
//  Marvel
//
//  Created by Vitor Costa on 27/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import Foundation

struct Related: Codable {
    var id: Int
    var title: String
    var description: String?
    var modified: String
    var thumbnail: Thumbnail
    var creators: Creators
    var prices: [Prices]?
}

struct Creators: Codable {
    var available: Int
    var items: [Creator]
}

struct Creator: Codable {
    var name: String
    var role: String
}

struct Prices: Codable {
    var type: String
    var price: Double
}
