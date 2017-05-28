//
//  DismissSlideHorSegue.swift
//  Urbaner
//
//  Created by wang-zhenjun on 2017/05/16.
//  Copyright © 2017 angeldsphinx. All rights reserved.
//

import UIKit

class DismissSlideHorSegue: UIStoryboardSegue {
    override func perform() {
        let src = self.source
        let dst = self.destination
        
        src.view.superview?.insertSubview(dst.view, belowSubview: src.view)
        src.view.transform = CGAffineTransform(translationX: 0, y: 0)
        
        UIView.animate(withDuration: 0.25,
                       delay: 0.0,
                       options: UIViewAnimationOptions.curveEaseInOut,
                       animations: {
                        src.view.transform = CGAffineTransform(translationX: src.view.frame.size.width, y: 0)
                       },
                       completion: { finished in
                        src.dismiss(animated: false, completion: nil)
                       })
    }
}
