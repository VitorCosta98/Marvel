//
//  Thumbnail.swift
//  Marvel
//
//  Created by Vitor Costa on 26/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import Foundation

struct Thumbnail: Codable {
    var path: String
    var ext: String

    enum CodingKeys: String, CodingKey {
        case path
        case ext = "extension"
    }
}
