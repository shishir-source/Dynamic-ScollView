//
//  TestCell.swift
//  dynamic scrollview
//
//  Created by Shishir Ahmed on 10/7/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

class TestCell: UITableViewCell {

    @IBOutlet weak var labelText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
