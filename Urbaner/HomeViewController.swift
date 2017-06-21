//
//  HomeViewController.swift
//  Urbaner-iOS
//
//  Created by wang-zhenjun on 2017/06/09.
//  Copyright © 2017 angeldsphinx. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController, UserAvatarRowEventDelegate {

    var categories = ["HOT RANKING", "WISHLIST", "PICK UP"]
    
    var userItemListRow: UserItemListRow?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell?

        if(indexPath.section == 0 && indexPath.row == 0){
            cell = tableView.dequeueReusableCell(withIdentifier: "userAvatarRow") as! UserAvatarRow
            
            (cell as! UserAvatarRow).userAvatars = loadUserAvatars()
            (cell as! UserAvatarRow).eventDelegate = self
        }
        
        if(indexPath.section == 1 && indexPath.row == 0){
            cell = tableView.dequeueReusableCell(withIdentifier: "userItemListRow") as! UserItemListRow
            
            (cell as! UserItemListRow).userItemBanners = loadUserItemBanners()!
            (cell as! UserItemListRow).currentUserID = "user1"
            
            userItemListRow = cell as? UserItemListRow
        }
        
        if(indexPath.section == 2 && indexPath.row == 0){
            cell = tableView.dequeueReusableCell(withIdentifier: "categoryRow") as! CategoryRow
            
            (cell as! CategoryRow).categoryBanners = loadCategoryBanners()
        }

        
        return cell!
    }
    
    
    fileprivate func loadUserAvatars() -> [UserAvatar] {
        
        var users = [UserAvatar]()
        let inputFile = Bundle.main.path(forResource: "users", ofType: "plist")
        
        let inputDataArray = NSArray(contentsOfFile: inputFile!)
        
        for inputItem in inputDataArray as! [Dictionary<String, String>] {
            let userAvatar = UserAvatar(dataDictionary: inputItem)
            users.append(userAvatar)
        }
        
        return users
    }
    
    fileprivate func loadUserItemBanners() -> [String: [UserItemBanner]]? {
        
        var userItemBanners = [String: [UserItemBanner]]()

        let inputFile = Bundle.main.path(forResource: "userItemBanners", ofType: "plist")
        
        let inputDataDict = NSDictionary(contentsOfFile: inputFile!)
        
        for (userID, bannerURLs) in inputDataDict! {
            var itemBanners = [UserItemBanner]()

            for bannerURL in (bannerURLs as! [String]) {
                let userItemBanner = UserItemBanner(userID as! String, bannerURL)
                itemBanners.append(userItemBanner)
            }
            
            userItemBanners[userID as! String] = itemBanners
        }
        
        return userItemBanners
    }
    
    fileprivate func loadCategoryBanners() -> [CategoryBanner] {
        
        var categoryBanners = [CategoryBanner]()
        
        let inputFile = Bundle.main.path(forResource: "categoryBanners", ofType: "plist")
        
        let inputDataDict = NSDictionary(contentsOfFile: inputFile!)
        
        for (bannerURL, category) in inputDataDict as! Dictionary<String, String> {
            let categoryBanner = CategoryBanner(category, bannerURL)
            categoryBanners.append(categoryBanner)
        }
        
        return categoryBanners
    }
    
    func currentActiveUserAvatar(userAvatar: UserAvatar) {        
        userItemListRow?.currentUserID = userAvatar.userAvatarURL
        userItemListRow?.userItemListCollectionView.reloadSections(IndexSet(integer: 0))
    }
}
