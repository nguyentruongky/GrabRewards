//
//  RewardView.swift
//  GrabRewards
//
//  Created by Ky Nguyen on 3/4/19.
//  Copyright © 2019 Ky Nguyen. All rights reserved.
//

import UIKit


private let viewHeight: CGFloat = 285
class RewardView: knView {
    let titleLabel = UIMaker.makeLabel(font: UIFont.boldSystemFont(ofSize: 20))
    
    var datasource = [Reward]() { didSet { collectionView.reloadData() }}
    var collectionView: UICollectionView!
    
    convenience init(title: String) {
        self.init()
        titleLabel.text = title
    }
    
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
        collectionView.register(RewardCollectionCell.self,
                                forCellWithReuseIdentifier: "RewardCollectionCell")
        collectionView.contentInset = UIEdgeInsets(left: padding, right: padding / 2)
        addSubviews(views: titleLabel, collectionView)
        
        titleLabel.topLeft(toView: self, top: padding, left: padding)
        
        collectionView.horizontal(toView: self)
        collectionView.verticalSpacing(toView: titleLabel, space: padding / 2)
        collectionView.bottom(toView: self)
        collectionView.height(viewHeight)
        
        backgroundColor = .white
    }
}

extension RewardView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return datasource.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RewardCollectionCell", for: indexPath) as! RewardCollectionCell
        cell.data = datasource[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: screenWidth / 1.25, height: viewHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


class RewardCollectionCell: knCollectionCell {
    let bannerImageView = UIMaker.makeImageView(contentMode: .scaleAspectFill)
    let logoImageView = UIMaker.makeImageView()
    let merchantNameLabel = UIMaker.makeLabel(font: UIFont.boldSystemFont(ofSize: 15),
                                              color: .white)
    let titleLabel = UIMaker.makeLabel(font: UIFont.boldSystemFont(ofSize: 15),
                                              color: .black)
    let pointLabel = UIMaker.makeLabel(font: UIFont.systemFont(ofSize: 15),
                                              color: .black)
    
    var data: Reward? {
        didSet {
            bannerImageView.downloadImage(from: data?.bannerUrl)
            logoImageView.downloadImage(from: data?.merchantLogoUrl)
            merchantNameLabel.text = data?.merchantName
            titleLabel.text = data?.title
            let point = data?.point ?? 0
            pointLabel.text = "\(point) points"
        }
    }
    
    override func setupView() {
        addSubviews(views: bannerImageView, logoImageView, merchantNameLabel, titleLabel, pointLabel)
        
        bannerImageView.horizontal(toView: self, leftPadding: 0, rightPadding: -padding / 2)
        bannerImageView.top(toView: self)
        bannerImageView.height(200)
        bannerImageView.setCorner(radius: 7)
        
        logoImageView.bottomLeft(toView: bannerImageView, bottom: -padding / 2, left: padding / 2)
        logoImageView.square(edge: 32)
        logoImageView.setCorner(radius: 7)
        
        merchantNameLabel.leftHorizontalSpacing(toView: logoImageView, space: -padding / 2)
        merchantNameLabel.centerY(toView: logoImageView)
        
        titleLabel.horizontal(toView: bannerImageView)
        titleLabel.verticalSpacing(toView: bannerImageView, space: padding / 2)
        
        pointLabel.left(toView: titleLabel)
        pointLabel.verticalSpacing(toView: titleLabel, space: padding / 2)
        pointLabel.bottom(toView: self, space: -padding)
    }
}


struct Reward {
    var merchantLogoUrl: String?
    var merchantName: String?
    var bannerUrl: String?
    var title: String?
    var point = 0
    
    init(merchantLogo: String, merchantName: String, banner: String, title: String, point: Int) {
        self.merchantLogoUrl = merchantLogo
        self.merchantName = merchantName
        self.bannerUrl = banner
        self.title = title
        self.point = point
    }
}
