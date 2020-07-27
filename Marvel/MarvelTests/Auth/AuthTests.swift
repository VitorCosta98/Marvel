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
        auth = Auth(endPoint: .characters)
    }

    override func tearDown() {
        auth = nil
    }

    func testIfURLStringGeneratedIsCorrect() throws {
        let urlString = auth?.makeStringURL(apiKey: "myApiKey", timeStamp: 123, privateKey: "myPrivateKey")
        
        //simulating creating a hash
        let hash = "123myPrivateKeymyApiKey".MD5()
        XCTAssertEqual(urlString, "https://gateway.marvel.com/v1/public/characters?ts=123&apikey=myApiKey&hash=\(hash)")
    }
}
