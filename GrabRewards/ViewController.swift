//
//  ViewController.swift
//  GrabRewards
//
//  Created by Ky Nguyen on 3/4/19.
//  Copyright © 2019 Ky Nguyen. All rights reserved.
//

import UIKit

class ViewController: knStaticListController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    let categoryView = CategoryView()
    
    override func setupView() {
        let categoryCell = knTableCell.wrap(view: categoryView)
        
        datasource = [categoryCell]
        
        categoryView.datasource = [
            Category(icon: "1", name: "All"),
            Category(icon: "2", name: "Limit Edition"),
            Category(icon: "3", name: "Food"),
            Category(icon: "4", name: "Grab"),
            Category(icon: "5", name: "Service"),
            Category(icon: "6", name: "Shopping"),
            Category(icon: "7", name: "Entertainment"),
            Category(icon: "8", name: "Travel"),
        ]
    }
}

