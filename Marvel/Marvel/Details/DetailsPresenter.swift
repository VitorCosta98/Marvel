//
//  DetailsPresenter.swift
//  Marvel
//
//  Created by Vitor Costa on 27/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import Foundation

enum RelatedType {
    case comics
    case series
}

protocol DetailsPresenterProtocol {
    var view: DetailsViewControllerProtocol? { get set }
    func show(related: [Related], type: RelatedType)
    func setup(image: String, name: String)
}

class DetailsPresenter: DetailsPresenterProtocol {
    var view: DetailsViewControllerProtocol?
    
    init(view: DetailsViewControllerProtocol) {
        self.view = view
    }
    
    func show(related: [Related], type: RelatedType) {
        switch type {
        case .comics:
            view?.show(comics: related)
        case .series:
            view?.show(series: related)
        }
    }
    
    func setup(image: String, name: String) {
        if let imageURL = URL(string: image) {
            view?.setup(urlCharacterImage: imageURL, characterName: name)
        }
    }
}
