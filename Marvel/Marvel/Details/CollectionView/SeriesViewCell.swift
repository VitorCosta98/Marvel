//
//  SeriesViewCell.swift
//  Marvel
//
//  Created by Vitor Costa on 27/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import UIKit

class SeriesViewCell: UICollectionViewCell {
    @IBOutlet weak var serieImage: UIImageView!
    @IBOutlet weak var serieName: UILabel!
    
    func setup(imageURL: URL, name: String) {
        if let data = try? Data(contentsOf: imageURL) {
            serieImage.image = UIImage(data: data)
        }
        serieName.text = name
    }
}
