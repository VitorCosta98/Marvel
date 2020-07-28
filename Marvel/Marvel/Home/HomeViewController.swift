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
    func show(characters: [Character])
}

class HomeViewController: UIViewController, HomeViewControlerProtocol {
    @IBOutlet weak var tableView: UITableView!
    var interactor: HomeInteractorProtocol?
    var characters: [Character] = []
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TableView", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableCell")
        tableView.delegate = self
        tableView.dataSource = self
        interactor?.onViewLoad()
    }
    
    //MARK: Functions
    func show(characters: [Character]) {
        self.characters = characters
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

//MARK: Extension - TableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as? HomeViewCell {
            guard let urlImage = URL(string: "\(characters[indexPath.row].thumbnail.path).\(characters[indexPath.row].thumbnail.ext)") else { return UITableViewCell()}
            cell.setup(imageURL: urlImage, name: characters[indexPath.row].name)
            return cell
        }
        return UITableViewCell()
    }
}
