//
//  DetailsPresenterTests.swift
//  MarvelTests
//
//  Created by Vitor Costa on 28/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import XCTest
@testable ipmort Marvel

class DetailsPresenterTests: XCTestCase {
    var view: MockViewController?
    var presenter: DetailsPresenter?
    
    override func setUp() {
        view = MockViewController()
        presenter = DetailsPresenter(view: view)
    }

    override func tearDown() {
        view = nil
        presenter = nil
    }

    func testIfPresenterIsCorrectlyCallingFuncShowOfTheView() {
        
    }
}

class MockDetailsViewController: DetailsViewControllerProtocol {
    var interactor: DetailsViewInteractorProtocol?
    var showComicsWasCalled = false
    var showSeriesWasCalled = false
    
    func show(comics: [Related]) {
        showComicsWasCalled = true
    }
    
    func show(series: [Related]) {
        showComicsWasCalled = true
    }
}
