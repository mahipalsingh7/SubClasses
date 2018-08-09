//
//  MSTextView.swift
//
//  Created by Mahipal on 07/05/18.
//  Copyright © 2018 Mahipal Singh. All rights reserved.
//

import UIKit

@IBDesignable class MSTextView: UITextView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        let fontname = self.font?.fontName
        let fontsize = self.font?.pointSize.fontSIZE()
        self.font = UIFont(name: fontname!, size: fontsize!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    func setup() {
        textContainerInset = UIEdgeInsets.zero
        textContainer.lineFragmentPadding = 0
        
    }
    override func layoutIfNeeded() {
        //        var b = bounds
        //        let h = sizeThatFits(CGSize(
        //            width: (superview?.bounds.size.width)!,
        //            height: CGFloat.greatestFiniteMagnitude)
        //            ).height
        //        b.size.height = h
        //        bounds = b
    }
}
