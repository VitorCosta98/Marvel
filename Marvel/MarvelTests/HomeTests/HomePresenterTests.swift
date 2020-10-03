//
//  HomePresenterTests.swift
//  MarvelTests
//
//  Created by Vitor Costa on 27/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import XCTest
@testable import Marvel

class HomePresenterTests: XCTestCase {
    var view: MockViewController?
    var presenter: HomePresenter?
    var characters: [Character]?
    
    override func setUp() {
        view = MockViewController()
        presenter = HomePresenter(view: view!)
        
        let thumb = Thumbnail(path: "", ext: "")
        let items = [Items(name: "", resourceURI: "")]
        let relatedWorks = RelatedWorks(returned: 0, items: items, available: 0, collectionURI: "")
        let character1 = Character(id: 0, name: "", thumbnail: thumb, comics: relatedWorks, series: relatedWorks)
        let character2 = Character(id: 0, name: "", thumbnail: thumb, comics: relatedWorks, series: relatedWorks)
        characters = [character1, character2]
    }

    override func tearDown() {
        view = nil
        presenter = nil
        characters = nil
    }

    func testIfPresenterIsCorrectlyCallingTheView() {
        guard let characters = characters, let view = view else { return }
        presenter?.show(characters: characters)
        XCTAssertTrue(view.showWasCalled)
    }
    
    func testIfPresenterIsCorrectlyPassingCharacters() {
        guard let characters = characters else { return }
        presenter?.show(characters: characters)
        XCTAssertEqual(characters.count, view?.characters.count)
    }
}

class MockViewController: HomeViewControlerProtocol {
    var interactor: HomeInteractorProtocol?
    var showWasCalled = false
    var characters: [Character] = []
    
    func show(characters: [Character]) {
        self.characters = characters
        showWasCalled = true
    }
}
