//
//  DetailsViewCell.swift
//  Marvel
//
//  Created by Vitor Costa on 27/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import UIKit

class ComicsViewCell: UICollectionViewCell {
    @IBOutlet weak var comicImage: UIImageView!
    @IBOutlet weak var comicTitle: UILabel!
    
    func setup(imageURL: URL, title: String) {
        if let data = try? Data(contentsOf: imageURL) {
            comicImage.image = UIImage(data: data)
        }
        comicTitle.text = title
    }
}
