//
//  Header.swift
//  AnimationTest
//
//  Created by Shishir Ahmed on 10/6/20.
//  Copyright © 2020 Shishir Ahmed. All rights reserved.
//

import UIKit

protocol HeaderDelegate:class {
    func sellAll(cell: Header)
}

class Header: UICollectionReusableView {
    
    let label = UILabel()
    let button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("See All", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    weak var delegate: HeaderDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label.text = "Categories"
        button.addTarget(self, action: #selector(seeAllButtonPressed), for: .touchUpInside)
        
        addSubview(button)
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 0, y: 0, width: 100, height: 50)
        button.frame = CGRect(x: self.bounds.size.width - 50, y: 0, width: 50, height: 50)
    }
    
    @objc func seeAllButtonPressed(){
        delegate?.sellAll(cell: self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
