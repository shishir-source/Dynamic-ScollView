//
//  SingleCategoryVC.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 10/6/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

class SingleCategoryVC: UIViewController {
    
    var newTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let title = newTitle else {return}
        navigationItem.title = title
    }

}
