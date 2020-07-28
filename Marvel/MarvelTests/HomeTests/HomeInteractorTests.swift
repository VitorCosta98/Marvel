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
    var presenter: MockPresenter?
    
    override func setUp() {
        worker = MockHomeWorker()
        presenter = MockPresenter()
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
    var response: APIResponse?
    
    func makeGETRequest(urlString: String, completion: @escaping (APIResponse) -> Void) {
        makeGETRequestWasCalled = true
        
        var characters: [Character] = []
        let thumb = Thumbnail(path: "", ext: "")
        let items = [Items(name: "", resourceURI: "")]
        let relatedWorks = RelatedWorks(returned: 0, items: items, available: 0, collectionURI: "")
        let character1 = Character(id: 0, name: "", thumbnail: thumb, comics: relatedWorks, series: relatedWorks)
        let character2 = Character(id: 0, name: "", thumbnail: thumb, comics: relatedWorks, series: relatedWorks)
        characters = [character1, character2]
        let apiData = APIData(offset: 0, limit: 0, total: 0, count: 0, results: characters)
        response = APIResponse(code: 0, status: "", data: apiData)
        characters = [character1, character2]
        guard let response = response else { return }
        
        completion(response)
    }

    func decode(data: Data) -> APIResponse? {
        decodeWasCalled = true
        return nil
    }
}

class MockPresenter: HomePresenterProtocol {
    var view: HomeViewControlerProtocol?
    var showWasCalled = false
    
    func show(characters: [Character]) {
        showWasCalled = true
    }
}
