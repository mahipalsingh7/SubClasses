//
//  MSLabel.swift
//  Created by Mahipal on 07/05/18.
//  Copyright © 2018 Mahipal Singh. All rights reserved.
//
import UIKit
import Foundation
/**
 MSLabel reset text Font to screen size
 */
class MSLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        let fontname = self.font.fontName
        let fontsize = self.font.pointSize.fontSIZE()
        self.font = UIFont(name: fontname, size: fontsize!)
        self.text = NSLocalizedString(self.text!, comment: "")
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 // set corner Radius  Default 0
        {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
   
     @IBInspectable open var lineSpacing:CGFloat = 0 {
     didSet {
     if lineSpacing == 0 {
     self.text = NSLocalizedString(self.text!, comment: "")
     }else {
     let paragraphStyle = NSMutableParagraphStyle()
     paragraphStyle.lineSpacing = (lineSpacing/667)*PHConstant.SCREEN_HEIGHT
     let attrString = NSMutableAttributedString(string: self.text!)
     attrString.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
     self.attributedText = attrString
     }
     
     }
    }
    
    
    @IBInspectable open var characterSpacing:CGFloat = 0 {
        didSet {
            if characterSpacing == 0 {
                self.text = NSLocalizedString(self.text!, comment: "")
            }else {
                let attributedString = NSMutableAttributedString(string: self.text!)
                attributedString.addAttribute(NSAttributedStringKey.kern, value: self.characterSpacing, range: NSRange(location: 0, length: attributedString.length))
                self.attributedText = attributedString
            }
            
        }
        
    }
}

@IBDesignable class TopAlignedLabel: MSLabel {
    override func drawText(in rect: CGRect) {
        if let stringText = text {
            let stringTextAsNSString = stringText as NSString
            let labelStringSize = stringTextAsNSString.boundingRect(with: CGSize(width: self.frame.width,height: CGFloat.greatestFiniteMagnitude),
                                                                    options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                                                    attributes: [NSAttributedStringKey.font: font],
                                                                    context: nil).size
            super.drawText(in: CGRect(x:0,y: 0,width: self.frame.width, height:ceil(labelStringSize.height)))
        } else {
            super.drawText(in: rect)
        }
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
}
