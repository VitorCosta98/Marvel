//
//  DetailsInteractor.swift
//  Marvel
//
//  Created by Vitor Costa on 27/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import Foundation

protocol DetailsInteractorProtocol {
    var worker: DetailsWorkerProtocol? { get set }
    var presenter: DetailsPresenterProtocol? { get set }
    func onViewLoad()
}

class DetailsInteractor: DetailsInteractorProtocol {
    var worker: DetailsWorkerProtocol?
    var presenter: DetailsPresenterProtocol?
    var character: Character?
    
    init(worker: DetailsWorkerProtocol, presenter: DetailsPresenterProtocol, id: Int) {
        self.worker = worker
        self.presenter = presenter
    }
    
    func onViewLoad() {
        guard let character = character else { return }
        presenter?.setup(image: "\(character.thumbnail.path).\(character.thumbnail.ext)", name: character.name)
        //fetch comics
        worker?.makeGETRequest(urlString: makeStringURL(related: character.comics)) { response in
            self.presenter?.show(related: response.data.results, type: .comics)
        }
        //fetch series
        worker?.makeGETRequest(urlString: makeStringURL(related: character.series)) { response in
            self.presenter?.show(related: response.data.results, type: .series)
        }
    }
    
    private func makeStringURL(related: RelatedWorks) -> String {
        let timeStamp = Int(Date().timeIntervalSince1970)
        let auth = Auth()
        return auth.makeAuthenticatedURL(baseURL: related.collectionURI, apiKey: PersonalAccess.apiKey.rawValue, timeStamp: timeStamp, privateKey: PersonalAccess.privateKey.rawValue)
    }
}
