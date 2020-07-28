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
    private let id: Int
    private let auth = Auth(endPoint: .comics)
    private let apiKey = "b64080ac39198f95abcdb20fc185b688"
    private let privateKey = "d4cce909b9e33cd8cb10d483c082a8fe2fca0322"
    
    init(worker: DetailsWorkerProtocol, presenter: DetailsPresenterProtocol, id: Int) {
        self.worker = worker
        self.presenter = presenter
        self.id = id
    }
    
    func onViewLoad() {
        worker?.makeGETRequest(urlString: makeStringURL()) { response in
            self.presenter?.show(comics: response.data.results)
        }
    }
    
    private func makeStringURL() -> String {
        let timeStamp = Int(Date().timeIntervalSince1970)
        return auth.makeStringURL(apiKey: apiKey, timeStamp: timeStamp, privateKey: privateKey, id: "\(id)")
    }
}
