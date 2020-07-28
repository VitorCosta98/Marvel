//
//  DetailsViewController.swift
//  Marvel
//
//  Created by Vitor Costa on 27/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import UIKit

protocol DetailsViewControlerProtocol {
    var interactor: DetailsInteractorProtocol? { get set }
    func show(comics: [Comics])
}

class DetailsViewController: UIViewController, DetailsViewControlerProtocol {
    @IBOutlet weak var imageCharacter: UIImageView!
    @IBOutlet weak var nameCharacter: UILabel!
    @IBOutlet weak var collectionComics: UICollectionView!
    @IBOutlet weak var collectionSeries: UICollectionView!
    var interactor: DetailsInteractorProtocol?
    var comics: [Comics] = []
    
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
    func show(comics: [Comics]) {
        self.comics = comics
        DispatchQueue.main.async {
            self.collectionComics.reloadData()
        }
    }
}

//MARK: Extensions
extension DetailsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionComics {
            return comics.count
        }
        return comics.count
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
                guard let urlImage = URL(string: "https://images-na.ssl-images-amazon.com/images/I/817R7vTuFwL.jpg") else { return UICollectionViewCell() }
                seriesCell.setup(imageURL: urlImage, name: "some")
                return seriesCell
            }
        }
        return UICollectionViewCell()
    }
}
