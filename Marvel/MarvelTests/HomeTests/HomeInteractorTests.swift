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
    var presenter: MockHomePresenter?
    
    override func setUp() {
        worker = MockHomeWorker()
        presenter = MockHomePresenter()
        interactor = HomeInteractor(worker: worker!, presenter: presenter!)
    }

    override func tearDown() {
        worker = nil
        interactor = nil
        presenter = nil
    }

    func testIfTheInteractorIsCallingTheWorker() {
        interactor?.onViewLoad()
        guard let worker = worker else { return }
        XCTAssertTrue(worker.makeGETRequestWasCalled)
    }
    
    func testIfTheInteractorIsCallingThePresenter() {
        interactor?.onViewLoad()
        guard let presenter = presenter else { return }
        XCTAssertTrue(presenter.showWasCalled)
    }
}

class MockHomeWorker: HomeWorkerProtocol {
    var decodeWasCalled = false
    var makeGETRequestWasCalled = false
    var response: APIResponseCharacters?
    
    func makeGETRequest(urlString: String, completion: @escaping (APIResponseCharacters) -> Void) {
        makeGETRequestWasCalled = true
        
        let apiData = APIDataCharacters(offset: 0, limit: 0, total: 0, count: 0, results: [Character]())
        response = APIResponseCharacters(code: 0, status: "", data: apiData)
        
        guard let response = response else { return }
        
        completion(response)
    }

    func decode(data: Data) -> APIResponseCharacters? {
        decodeWasCalled = true
        return nil
    }
}

class MockHomePresenter: HomePresenterProtocol {
    var view: HomeViewControlerProtocol?
    var showWasCalled = false
    
    func show(characters: [Character]) {
        showWasCalled = true
    }
}
