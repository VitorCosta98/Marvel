//
//  DetailsPresenterTests.swift
//  MarvelTests
//
//  Created by Vitor Costa on 28/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import XCTest
@testable import Marvel

class DetailsPresenterTests: XCTestCase {
    var view: MockDetailsViewController?
    var presenter: DetailsPresenter?
    
    override func setUp() {
        view = MockDetailsViewController()
        presenter = DetailsPresenter(view: view!)
    }

    override func tearDown() {
        view = nil
        presenter = nil
    }

    func testIfPresenterIsCorrectlyCallingFuncShowOfTheViewWhenTypeIsSeries() {
        presenter?.show(related: [Related](), type: .series)
        XCTAssertTrue(view?.showSeriesWasCalled ?? false)
    }
    
    func testIfPresenterIsCorrectlyCallingFuncShowOfTheViewWhenTypeIsComics() {
        presenter?.show(related: [Related](), type: .comics)
        XCTAssertTrue(view?.showComicsWasCalled ?? false)
    }
    
    func testIfPresenterIsCorrectlyCallingFuncSetup() {
        presenter?.setup(image: "https://www.marvel.com", name: "")
        XCTAssertTrue(view?.setupWasCalled ?? false)
    }
}

class MockDetailsViewController: DetailsViewControllerProtocol {
    var interactor: DetailsInteractorProtocol?
    var showComicsWasCalled = false
    var showSeriesWasCalled = false
    var setupWasCalled = false
    
    func show(comics: [Related]) {
        showComicsWasCalled = true
    }
    
    func show(series: [Related]) {
        showSeriesWasCalled = true
    }
    
    func setup(urlCharacterImage: URL, characterName: String) {
        setupWasCalled = true
    }
}
