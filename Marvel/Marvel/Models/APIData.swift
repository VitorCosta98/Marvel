//
//  APIData.swift
//  Marvel
//
//  Created by Vitor Costa on 26/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import Foundation

struct APIData: Codable {
    var offset: Int
    var limit: Int
    var total: Int
    var count: Int
    var results: [Character]
}
