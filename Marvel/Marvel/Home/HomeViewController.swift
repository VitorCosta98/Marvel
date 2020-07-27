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
    @IBOutlet weak var tableView: UITableView!
    var interactor: HomeInteractorProtocol?
    var characters: [Character] = []
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TableView", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "HomeCell")
        tableView.delegate = self
        tableView.dataSource = self
        interactor?.onViewLoad()
        let items = [Items(name: "someName", resourceURI: "someResource")]
        let relatedWorks = RelatedWorks(returned: 0, items: items, available: 0)
        let thumbnail = Thumbnail(path: "somePath", ext: "someExtension")
        let character1: Character = Character(id: 0, name: "Naruto", thumbnail: thumbnail, comics: relatedWorks, series: relatedWorks)
        let character2: Character = Character(id: 0, name: "Sasuke", thumbnail: thumbnail, comics: relatedWorks, series: relatedWorks)
        characters.append(character1)
        characters.append(character2)
    }
}

//MARK: Extension - TableView
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as? HomeViewCell {
            guard let urlImage = URL(string: "https://conteudo.imguol.com.br/c/entretenimento/16/2017/06/27/naruto-1498593686428_v2_450x337.png") else { return UITableViewCell()}
            cell.setup(imageURL: urlImage, name: characters[indexPath.row].name)
            return cell
        }
        return UITableViewCell()
    }
}
