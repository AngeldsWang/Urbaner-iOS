//
//  UserItemBanner.swift
//  Urbaner-iOS
//
//  Created by wang-zhenjun on 2017/06/11.
//  Copyright © 2017 angeldsphinx. All rights reserved.
//

import Foundation

class UserItemBanner {
    
    var userItemBannerURL: String
    var userID: String
    
    init(_ userIDStr: String, _ bannerURL: String) {
        userItemBannerURL = bannerURL
        userID = userIDStr
    }
    
    class func newUserItemBanner(_ userIDStr: String, _ bannerURL: String) -> UserItemBanner {
        return UserItemBanner(userIDStr, bannerURL)
    }
    
}
