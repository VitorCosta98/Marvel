//
//  HomeInteractor.swift
//  Marvel
//
//  Created by Vitor Costa on 27/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import Foundation

protocol HomeInteractorProtocol {
    var worker: HomeWorkerProtocol? { get set }
    var presenter: HomePresenterProtocol? { get set }
    func onViewLoad()
}

class HomeInteractor: HomeInteractorProtocol {
    var worker: HomeWorkerProtocol?
    var presenter: HomePresenterProtocol?
    private let auth = Auth(endPoint: .characters)
    private let apiKey = "b64080ac39198f95abcdb20fc185b688"
    private let privateKey = "d4cce909b9e33cd8cb10d483c082a8fe2fca0322"
    
    init(worker: HomeWorkerProtocol, presenter: HomePresenterProtocol) {
        self.worker = worker
        self.presenter = presenter
    }
    
    func onViewLoad() {
        worker?.makeGETRequest(urlString: makeStringURL()) { response in
            self.presenter?.show(characters: response.data.results)
        }
    }
    
    private func makeStringURL() -> String {
        let timeStamp = Int(Date().timeIntervalSince1970)
        return auth.makeStringURL(apiKey: apiKey, timeStamp: timeStamp, privateKey: privateKey)
    }
}
