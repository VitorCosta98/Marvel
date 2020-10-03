//
//  AuthTests.swift
//  MarvelTests
//
//  Created by Vitor Costa on 26/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import XCTest
@testable import Marvel

class AuthTests: XCTestCase {
    var auth: Auth?
    
    override func setUp() {
        auth = Auth()
    }

    override func tearDown() {
        auth = nil
    }

    func testIfURLStringGeneratedIsCorrect() throws {
        let timeStamp = Int(NSDate().timeIntervalSince1970)
        let privateKey = "123"
        let apiKey = "MyAPIKey"
        let baseURL = "https:\\www.marvel.com"
        let hash = "\(timeStamp)\(privateKey)\(apiKey)".MD5()
        let mockURLResult = "\(baseURL)?ts=\(timeStamp)&apikey=\(apiKey)&hash=\(hash)"
        
        let urlGenerated = auth?.makeAuthenticatedURL(baseURL: baseURL, apiKey: apiKey, timeStamp: timeStamp, privateKey: privateKey)
        
        XCTAssertEqual(mockURLResult, urlGenerated)
    }
}
