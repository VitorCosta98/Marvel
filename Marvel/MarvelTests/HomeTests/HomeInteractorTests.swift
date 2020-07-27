//
//  HomeInteractorTests.swift
//  MarvelTests
//
//  Created by Vitor Costa on 27/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import XCTest
@testable import Marvel

class HomeInteractorTests: XCTestCase {
    var worker: MockHomeWorker?
    var interactor: HomeInteractor?
    
    override func setUp() {
        worker = MockHomeWorker()
        interactor = HomeInteractor(worker: worker!)
    }

    override func tearDown() {
        worker = nil
        interactor = nil
    }

    func testIfTheInteractorIsCallingTheWorker() {
        interactor?.onViewLoad()
        guard let worker = worker else { return }
        XCTAssertTrue(worker.makeGETRequestWasCalled)
    }
}

class MockHomeWorker: HomeWorkerProtocol {
    var decodeWasCalled = false
    var makeGETRequestWasCalled = false
    
    func makeGETRequest(urlString: String, completion: @escaping (APIResponse) -> Void) {
        makeGETRequestWasCalled = true
    }

    func decode(data: Data) -> APIResponse? {
        decodeWasCalled = true
        return nil
    }
}
