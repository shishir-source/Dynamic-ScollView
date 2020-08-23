//
//  BookCell.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 10/6/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

class SliderCell: UICollectionViewCell {
    
    static let identfier = "SliderCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .green
    }
    
    static func nib() -> UINib {
        return UINib(nibName: "SliderCell", bundle: nil)
    }

}
