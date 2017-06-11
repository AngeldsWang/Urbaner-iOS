//
//  UserAvatarCell.swift
//  Urbaner-iOS
//
//  Created by wang-zhenjun on 2017/06/11.
//  Copyright © 2017 angeldsphinx. All rights reserved.
//

import UIKit

class UserAvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var userAvatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
   
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUserAvatar(_ userAvatar: UserAvatar) {
        userAvatarImageView.image = UIImage(named: userAvatar.userAvatarURL)
        userNameLabel.text = userAvatar.userName
    }
    
    func setLayout() {
        userAvatarImageView.layer.cornerRadius = self.userAvatarImageView.frame.size.width / 2
        userAvatarImageView.clipsToBounds = true
        
        userAvatarImageView.layer.borderWidth = 3.0
        userAvatarImageView.layer.borderColor = UIColor.white.cgColor
    }

}
