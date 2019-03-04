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

    let forMeReward = RewardView(title: "Just for you")
    let limitRewards = RewardView(title: "Limit rewards")
    let categoryView = CategoryView()
    
    override func setupView() {
        view.addSubviews(views: tableView)
        tableView.fill(toView: view)
        let categoryCell = knTableCell.wrap(view: categoryView, space: UIEdgeInsets(bottom: 12))
        categoryCell.backgroundColor = .lightGray
        
        let forMeCell = knTableCell.wrap(view: forMeReward, space: UIEdgeInsets(bottom: 12))
        forMeCell.backgroundColor = .lightGray
//        forMeReward.backgroundColor = .white
        
        let limitCell = knTableCell.wrap(view: limitRewards, space: UIEdgeInsets(bottom: 12))
        limitCell.backgroundColor = .lightGray
//        limitRewards.backgroundColor = .white
        
        datasource = [categoryCell, forMeCell, limitCell]
        
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
        
        let rewards = [
            Reward(merchantLogo: "https://media.franoppnetwork.com/media/concept-logo/gong-cha-usa-250x250.png?v=1", merchantName: "Gong Cha", banner: "https://www.8days.sg/image/9448028/16x9/1920/1080/61d6eb71675b012fa506f1a02a98430f/tx/a68i8605.jpg", title: "Save 15%", point: 750),
            Reward(merchantLogo: "https://media.franoppnetwork.com/media/concept-logo/gong-cha-usa-250x250.png?v=1", merchantName: "Gong Cha", banner: "https://www.8days.sg/image/9448028/16x9/1920/1080/61d6eb71675b012fa506f1a02a98430f/tx/a68i8605.jpg", title: "Save 15%", point: 750),
            Reward(merchantLogo: "https://media.franoppnetwork.com/media/concept-logo/gong-cha-usa-250x250.png?v=1", merchantName: "Gong Cha", banner: "https://www.8days.sg/image/9448028/16x9/1920/1080/61d6eb71675b012fa506f1a02a98430f/tx/a68i8605.jpg", title: "Save 15%", point: 750)
        ]
        
        forMeReward.datasource = rewards
        limitRewards.datasource = rewards
    }
}

