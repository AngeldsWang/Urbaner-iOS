//
//  UrbanLabel.swift
//  Urbaner
//
//  Created by wang-zhenjun on 2017/05/25.
//  Copyright © 2017 angeldsphinx. All rights reserved.
//

import UIKit

class UrbanLabel: UILabel {
    
    static var kerning: CGFloat = 2.0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setKerning(kern: Float(UrbanLabel.kerning))
    }

    func setKerning(kern: Float) {
        if let textString = text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(NSKernAttributeName, value: kern, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }

}
