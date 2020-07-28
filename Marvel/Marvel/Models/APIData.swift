//
//  APIData.swift
//  Marvel
//
//  Created by Vitor Costa on 26/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import Foundation

struct APIDataCharacters: Codable {
    var offset: Int
    var limit: Int
    var total: Int 
    var count: Int
    var results: [Character]
}

struct APIDataComics: Codable {
    var offset: Int
    var limit: Int
    var total: Int
    var count: Int
    var results: [Related]
}
