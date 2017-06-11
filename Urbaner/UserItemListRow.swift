//
//  UserItemListRow.swift
//  Urbaner-iOS
//
//  Created by wang-zhenjun on 2017/06/08.
//  Copyright © 2017 angeldsphinx. All rights reserved.
//

import UIKit

class UserItemListRow: UITableViewCell, UICollectionViewDataSource {
    
    var userItemBanners: [String: [UserItemBanner]] = [:]
    var currentUserID: String? = nil
   
    @IBOutlet weak var userItemListCollectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userItemBanners[currentUserID!]!.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userItemBannerCell", for: indexPath) as! UserItemBannerCell
        cell.setUserItemBanner((userItemBanners[currentUserID!]?[indexPath.row])!)
        cell.setLayout()
        return cell
    }
}
