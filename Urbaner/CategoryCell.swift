//
//  CategoryCell.swift
//  Urbaner-iOS
//
//  Created by wang-zhenjun on 2017/06/21.
//  Copyright © 2017 angeldsphinx. All rights reserved.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUserItemBanner(_ userItemBanner: UserItemBanner) {
        categoryImageView.image = UIImage(named: userItemBanner.userItemBannerURL)
    }
    
    func setLayout() {
        categoryImageView.layer.cornerRadius = 5.0
        categoryImageView.clipsToBounds = true
    }

}
