//
//  CategoryRow.swift
//  Urbaner-iOS
//
//  Created by wang-zhenjun on 2017/06/21.
//  Copyright © 2017 angeldsphinx. All rights reserved.
//

import UIKit

class CategoryRow: UITableViewCell, UICollectionViewDataSource {
    
    var categoryBanners: [CategoryBanner] = []

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryBanners.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCell
        cell.setCategoryBanner(categoryBanners[indexPath.row])
        cell.setLayout()
        return cell
    }
}
