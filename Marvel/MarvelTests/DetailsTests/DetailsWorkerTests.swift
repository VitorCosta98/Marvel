//
//  DetailsWorkerTests.swift
//  MarvelTests
//
//  Created by Vitor Costa on 03/10/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import XCTest
@testable import Marvel

class DetailsWorkerTests: XCTestCase {
    var worker: DetailsWorker?
    var response: APIResponseComics?
    
    override func setUp() {
        worker = DetailsWorker()
    }

    override func tearDown() {
        worker = nil
        response = nil
    }

    func testIfTheFuncDecodeItsWorks() {
        let bundle = Bundle(for: type(of: self))
        
        guard let bundlePath = bundle.url(forResource: "APIResponseComic", withExtension: "json") else {
            XCTFail("Missing file: APIResponseComic.json")
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
