//
//  Character.swift
//  Marvel
//
//  Created by Vitor Costa on 26/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import Foundation

struct Character: Codable {
    var id: Int
    var name: String
    var thumbnail: Thumbnail
    var comics: RelatedWorks
    var series: RelatedWorks
}

struct RelatedWorks: Codable {
    var returned: Int
    var items: [Items]
    var available: Int
    var collectionURI: String
}

struct Items: Codable {
    var name: String
    var resourceURI: String
}
