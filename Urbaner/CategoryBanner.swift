//
//  CategoryBanner.swift
//  Urbaner-iOS
//
//  Created by wang-zhenjun on 2017/06/21.
//  Copyright © 2017 angeldsphinx. All rights reserved.
//

import Foundation

class CategoryBanner {
    
    var categoryBannerURL: String
    var category: String
    
    init(_ categoryStr: String, _ bannerURL: String) {
        categoryBannerURL = bannerURL
        category = categoryStr
    }
    
    class func newCategoryBanner(_ categoryStr: String, _ bannerURL: String) -> CategoryBanner {
        return CategoryBanner(categoryStr, bannerURL)
    }
    
}
