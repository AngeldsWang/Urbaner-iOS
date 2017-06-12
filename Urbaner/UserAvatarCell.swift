//
//  UserAvatarCell.swift
//  Urbaner-iOS
//
//  Created by wang-zhenjun on 2017/06/11.
//  Copyright © 2017 angeldsphinx. All rights reserved.
//

import UIKit

protocol UserAvatarCellEventDelegate {
    func currentUserAvatarChanged(userAvatar: UserAvatar)
}

class UserAvatarCell: UICollectionViewCell {
    
    @IBOutlet weak var userAvatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    private weak var currentUserAvatar: UserAvatar!
    
    var eventDelegate: UserAvatarCellEventDelegate?
   
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setUserAvatar(_ userAvatar: UserAvatar) {
        userAvatarImageView.image = UIImage(named: userAvatar.userAvatarURL)
        userNameLabel.text = userAvatar.userName
        currentUserAvatar = userAvatar
    }
    
    func setLayout() {
        userAvatarImageView.layer.cornerRadius = self.userAvatarImageView.frame.size.width / 2
        userAvatarImageView.clipsToBounds = true
        
        userAvatarImageView.layer.borderWidth = 3.0
        userAvatarImageView.layer.borderColor = UIColor.white.cgColor
    }

    @IBAction func userAvatarBtnClicked(_ sender: UIButton) {
        
        if let del = eventDelegate {
            del.currentUserAvatarChanged(userAvatar: currentUserAvatar)
        }
    }
}
