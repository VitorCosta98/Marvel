//
//  HomeViewPresenter.swift
//  Marvel
//
//  Created by Vitor Costa on 27/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import Foundation

protocol HomePresenterProtocol {
    var view: HomeViewControlerProtocol? { get set }
    func show(characters: [Character])
}

class HomePresenter: HomePresenterProtocol {
    var view: HomeViewControlerProtocol?
    
    init(view: HomeViewControlerProtocol) {
        self.view = view
    }
    
    func show(characters: [Character]) {
        view?.show(characters: characters)
    }
}
