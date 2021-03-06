//
//  HomeWorker.swift
//  MarvelTests
//
//  Created by Vitor Costa on 27/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import XCTest
@testable import Marvel

class HomeWorkerTests: XCTestCase {
    var worker: HomeWorker?
    var response: APIResponseCharacters?
    
    override func setUp() {
        worker = HomeWorker()
    }

    override func tearDown() {
        worker = nil
        response = nil
    }

    func testIfTheFuncDecodeItsWorks() {
        let bundle = Bundle(for: type(of: self))
        
        guard let bundlePath = bundle.url(forResource: "APIResponseCharacter", withExtension: "json") else {
            XCTFail("Missing file: APIResponseCharacter.json")
            return
        }

        guard let data = try? Data(contentsOf: bundlePath) else {
            XCTFail("Unexpected error while enconding data.")
            return
        }
        
        response = worker?.decode(data: data)
        XCTAssertNotNil(response)
    }
}
