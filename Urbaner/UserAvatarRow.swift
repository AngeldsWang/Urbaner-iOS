//
//  UserAvatarRow.swift
//  Urbaner-iOS
//
//  Created by wang-zhenjun on 2017/06/09.
//  Copyright © 2017 angeldsphinx. All rights reserved.
//

import UIKit

protocol UserAvatarRowEventDelegate {
    func currentActiveUserAvatar(userAvatar: UserAvatar)
}

class UserAvatarRow: UITableViewCell, UICollectionViewDataSource, UserAvatarCellEventDelegate {
    
    var userAvatars: [UserAvatar] = []
    
    var eventDelegate: UserAvatarRowEventDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userAvatars.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userAvatarCell", for: indexPath) as! UserAvatarCell
        cell.setUserAvatar(userAvatars[indexPath.row])
        cell.setLayout()
        cell.eventDelegate = self
        return cell
    }
    
    func currentUserAvatarChanged(userAvatar: UserAvatar) {
        print("IN TABLE CELL !!!")
        print(userAvatar.userAvatarURL)
        if let del = eventDelegate {
            del.currentActiveUserAvatar(userAvatar: userAvatar)
        }
    }
}
