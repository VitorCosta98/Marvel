//
//  APIResponse.swift
//  Marvel
//
//  Created by Vitor Costa on 26/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import Foundation

struct APIResponseCharacters: Codable {
    var code: Int
    var status: String
    var data: APIDataCharacters
}

struct APIResponseComics: Codable {
    var code: Int
    var status: String
    var data: APIDataComics
}
