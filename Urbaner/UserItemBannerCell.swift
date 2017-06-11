//
//  UserItemBannerCell.swift
//  Urbaner-iOS
//
//  Created by wang-zhenjun on 2017/06/11.
//  Copyright © 2017 angeldsphinx. All rights reserved.
//

import UIKit

class UserItemBannerCell: UICollectionViewCell {
    
    @IBOutlet weak var userItemImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUserItemBanner(_ userItemBanner: UserItemBanner) {
        userItemImageView.image = UIImage(named: userItemBanner.userItemBannerURL)
    }
    
    func setLayout() {
        userItemImageView.layer.cornerRadius = 5.0
        userItemImageView.clipsToBounds = true
    }

}
