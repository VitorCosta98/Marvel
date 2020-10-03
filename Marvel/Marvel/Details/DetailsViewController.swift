//
//  DetailsViewController.swift
//  Marvel
//
//  Created by Vitor Costa on 27/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import UIKit

protocol DetailsViewControllerProtocol {
    var interactor: DetailsInteractorProtocol? { get set }
    func show(comics: [Related])
    func show(series: [Related])
    func setup(urlCharacterImage: URL, characterName: String)
}

class DetailsViewController: UIViewController, DetailsViewControllerProtocol {
    @IBOutlet weak var imageCharacter: UIImageView!
    @IBOutlet weak var nameCharacter: UILabel!
    @IBOutlet weak var collectionComics: UICollectionView!
    @IBOutlet weak var collectionSeries: UICollectionView!
    var interactor: DetailsInteractorProtocol?
    var comics: [Related] = []
    var series: [Related] = []
    
    //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibComicsCell = UINib(nibName: "ComicsViewCell", bundle: nil)
        collectionComics.register(nibComicsCell, forCellWithReuseIdentifier: "ComicsViewCell")
        let nibSeriesCell = UINib(nibName: "SeriesViewCell", bundle: nil)
        collectionSeries.register(nibSeriesCell, forCellWithReuseIdentifier: "SeriesViewCell")
        
        collectionComics.delegate = self
        collectionComics.dataSource = self
        collectionSeries.delegate = self
        collectionSeries.dataSource = self
        interactor?.onViewLoad()
    }
    
    //MARK: Functions
    func show(comics: [Related]) {
        self.comics = comics
        DispatchQueue.main.async {
            self.collectionComics.reloadData()
        }
    }
    
    func show(series: [Related]) {
        self.series = series
        DispatchQueue.main.async {
            self.collectionSeries.reloadData()
        }
    }
    
    func setup(urlCharacterImage: URL, characterName: String) {
        if let image = try? Data(contentsOf: urlCharacterImage) {
            imageCharacter.image = UIImage(data: image)
        }
        nameCharacter.text = characterName
    }
}

//MARK: Extensions
extension DetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionComics {
            return comics.count
        }
        return series.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionComics {
            if let comicCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ComicsViewCell", for: indexPath) as? ComicsViewCell {
                guard let urlImage = URL(string: "\(comics[indexPath.row].thumbnail.path).\(comics[indexPath.row].thumbnail.ext)") else { return UICollectionViewCell() }
                comicCell.setup(imageURL: urlImage, title: comics[indexPath.row].title)
                return comicCell
            }
        } else if collectionView == collectionSeries {
            if let seriesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SeriesViewCell", for: indexPath) as? SeriesViewCell {
                guard let urlImage = URL(string: "\(series[indexPath.row].thumbnail.path).\(series[indexPath.row].thumbnail.ext)") else { return UICollectionViewCell() }
                seriesCell.setup(imageURL: urlImage, name: series[indexPath.row].title)
                return seriesCell
            }
        }
        return UICollectionViewCell()
    }
}
