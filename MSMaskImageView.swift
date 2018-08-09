//
//  MSMaskImageView.swift
//  Created by Mahipal on 17/05/18.
//  Copyright © 2018 Mahipal Singh. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class UIImageViewWithMask: UIImageView {
    var maskImageView = UIImageView()
    
    @IBInspectable
    var maskImage: UIImage? {
        didSet {
            maskImageView.image = maskImage
            updateView()
        }
    }
    
    // This updates mask size when changing device orientation (portrait/landscape)
    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        if maskImageView.image != nil {
            maskImageView.frame = bounds
            mask = maskImageView
        }
    }
}
