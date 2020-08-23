//
//  MovieCell.swift
//  tmogaming
//
//  Created by Shishir Ahmed on 2/7/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
        
    static let identfier = "MovieCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "MovieCell", bundle: nil)
    }

}
