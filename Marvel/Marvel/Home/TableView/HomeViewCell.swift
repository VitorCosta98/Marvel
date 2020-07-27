//
//  HomeViewCell.swift
//  Marvel
//
//  Created by Vitor Costa on 27/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import UIKit

class HomeViewCell: UITableViewCell {
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    
    func setup(imageURL: URL, name: String) {
        if let data = try? Data(contentsOf: imageURL) {
            characterImage.image = UIImage(data: data)
        }
        characterName.text = name
    }
}
