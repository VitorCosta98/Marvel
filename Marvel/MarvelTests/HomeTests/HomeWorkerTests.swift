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
    var response: APIResponse?
    
    override func setUp() {
        worker = HomeWorker()
    }

    override func tearDown() {
        worker = nil
        response = nil
    }

    func testIfTheFuncDecodeItsWorks() {
        guard let data = """
            {
            "status" : "Ok",
            "data" : {
              "results":
                [
                {
                  "thumbnail" : {
                    "path" : "http:",
                    "extension" : "jpg"
                  },
                  "comics" : {
                    "returned" : 12,
                    "collectionURI" : "http:",
                    "items" : [
                      {
                        "name" : "Avengers: The Initiative (2007) #14",
                        "resourceURI" : "http:"
                      }],
                    "available" : 12
                  },
                  "series" : {
                    "returned" : 3,
                    "collectionURI" : "http:",
                    "items" : [
                      {
                        "name" : "Avengers: The Initiative (2007 - 2010)",
                        "resourceURI" : "http:"
                      }],
                    "available" : 3
                  },
                  "id" : 1011334,
                  "resourceURI" : "http:",
                  "description" : "",
                  "modified" : "2014-04-29T14:18:17-0400",
                  "name" : "3-D Man"
                  }
                }
                ],
              "offset" : 0,
              "count" : 20,
              "total" : 1493,
              "limit" : 20
            },
            "code" : 200,
            "copyright" : "© 2020 MARVEL",
            "attributionText" : "Data provided by Marvel. © 2020 MARVEL",
            "attributionHTML" : "<a href=\"http:",
            "etag" : "5943fb7b0894f1123002ad16593b0da8cd1fd1ac"
            }
        """.data(using: .utf8) else { return }
        response = worker?.decode(data: data)
        XCTAssertNotNil(response)
    }
}
