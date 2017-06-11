//
//  UserAvatar.swift
//  Urbaner-iOS
//
//  Created by wang-zhenjun on 2017/06/11.
//  Copyright © 2017 angeldsphinx. All rights reserved.
//

import Foundation

class UserAvatar {
    
    var userName: String
    var userAvatarURL: String
    
    init(dataDictionary: Dictionary<String, String>) {
        userName = dataDictionary["userName"]!
        userAvatarURL = dataDictionary["userAvatarURL"]!
    }
    
    class func newUserAvatar(_ dataDictionary: Dictionary<String, String>) -> UserAvatar {
        return UserAvatar(dataDictionary: dataDictionary)
    }
    
}
