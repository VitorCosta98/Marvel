//
//  DetailsInteractorTests.swift
//  MarvelTests
//
//  Created by Vitor Costa on 03/10/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import XCTest
@testable import Marvel

class DetailsInteractorTests: XCTestCase {
    var interactor: DetailsInteractor?
    var worker: MockDetailsWorker?
    var presenter: MockDetailsPresenter?
    var character: Character?
    
    override func setUp() {
        worker = MockDetailsWorker()
        presenter = MockDetailsPresenter()
        interactor = DetailsInteractor(worker: worker!, presenter: presenter!, id: 0)
        let relateds = RelatedWorks(returned: 1, items: [Items](), available: 0, collectionURI: "")
        character = Character(id: 1, name: "myHero", thumbnail: Thumbnail(path: "somePath", ext: "jpg"), comics: relateds, series: relateds)
    }
    
    override func tearDown() {
        interactor = nil
        worker = nil
        presenter = nil
        character = nil
    }
    
    func testIfPresentIsCorrectlyCallingFuncMakeGETRequestOfTheWorkerToComics() {
        interactor?.character = character
        interactor?.onViewLoad()
        XCTAssertTrue(worker?.makeGETRequestWasCalled ?? false)
        XCTAssertTrue(presenter?.relatedTypeComicsWasUsed ?? false)
    }
    
    func testIfPresentIsCorrectlyCallingFuncMakeGETRequestOfTheWorkerToSeries() {
        interactor?.character = character
        interactor?.onViewLoad()
        XCTAssertTrue(worker?.makeGETRequestWasCalled ?? false)
        XCTAssertTrue(presenter?.relatedTypeSeriesWasUsed ?? false)
    }
    
    func testIfPresentIsCorrectlyCallingFuncDecodeOfTheWorker() {
        interactor?.character = character
        interactor?.onViewLoad()
        XCTAssertTrue(worker?.decodeWasCalled ?? false)
    }
}

class MockDetailsWorker: DetailsWorkerProtocol {
    var makeGETRequestWasCalled = false
    var decodeWasCalled = false
    
    func makeGETRequest(urlString: String, completion: @escaping (APIResponseComics) -> Void) {
        makeGETRequestWasCalled = true
        guard let apiResponseComics = decode(data: Data()) else { return }
        
        completion(apiResponseComics)
    }
    
    func decode(data: Data) -> APIResponseComics? {
        decodeWasCalled = true
        return APIResponseComics(code: 0, status: "", data: APIDataComics(offset: 0, limit: 0, total: 0, count: 0, results: [Related]()))
    }
}

class MockDetailsPresenter: DetailsPresenterProtocol {
    var view: DetailsViewControllerProtocol?
    var showWasCalled = false
    var setupWasCalled = false
    var imageURL = ""
    var characterName = ""
    var relatedTypeComicsWasUsed = false
    var relatedTypeSeriesWasUsed = false
    
    func show(related: [Related], type: RelatedType) {
        switch type {
        case .comics:
            relatedTypeComicsWasUsed = true
        case .series:
            relatedTypeSeriesWasUsed = true
        }
        showWasCalled = true
    }
    
    func setup(image: String, name: String) {
        imageURL = image
        characterName = name
        setupWasCalled = true
    }
}
