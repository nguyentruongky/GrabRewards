//
//  CategoryView.swift
//  GrabRewards
//
//  Created by Ky Nguyen on 3/4/19.
//  Copyright © 2019 Ky Nguyen. All rights reserved.
//

import UIKit

let padding: CGFloat = 24

struct Category {
    var icon: String?
    var name: String?
    init(icon: String, name: String) {
        self.icon = icon
        self.name = name
    }
}

class CategoryView: knView {
    var datasource = [Category]() { didSet { collectionView.reloadData() }}
    var collectionView: UICollectionView!
    
    override func setupView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoryCollectionCell.self,
                                forCellWithReuseIdentifier: "CategoryCollectionCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return datasource.count }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionCell", for: indexPath) as! CategoryCollectionCell
        cell.data = datasource[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 66, height: 66)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat { return 0 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


class CategoryCollectionCell: UICollectionViewCell {
    let iconImageView = UIMaker.makeImageView()
    let nameLabel = UIMaker.makeLabel(alignment: .center)
    
    var data: Category? {
        didSet {
            iconImageView.image = UIImage(named: data?.icon)
            nameLabel.text = data?.name
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        addSubviews(views: iconImageView, nameLabel)
        
        iconImageView.square(edge: 48)
        iconImageView.backgroundColor = .lightGray
        iconImageView.top(toView: self, space: padding)
        iconImageView.centerX(toView: self)
        
        nameLabel.horizontal(toView: self, space: padding)
        nameLabel.bottom(toView: self, space: -padding)
    }
}
