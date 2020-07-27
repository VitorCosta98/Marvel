//
//  HomeViewController.swift
//  Marvel
//
//  Created by Vitor Costa on 26/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    let worker = HomeWorker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        worker.makeGETRequest { data in
            print(data)
        }
    }
}
