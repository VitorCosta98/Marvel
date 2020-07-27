//
//  HomeViewController.swift
//  Marvel
//
//  Created by Vitor Costa on 26/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import UIKit

protocol HomeViewControlerProtocol {
    var interactor: HomeInteractorProtocol? { get set }
}

class HomeViewController: UIViewController, HomeViewControlerProtocol {
    var interactor: HomeInteractorProtocol?
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.onViewLoad()
    }
}
