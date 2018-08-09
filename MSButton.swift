//
//  MSButton.swift
//  
//  Created by Mahipal on 07/05/18.
//  Copyright © 2018 Mahipal Singh. All rights reserved.
//
import UIKit
import Foundation
//import TransitionButton
///**
// MSAnimate button is custom Button to set corner radius border,border width and border color of Button
// */
//class MSAnimateButton: TransitionButton {
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//
//    required init(coder aDecoder: NSCoder) { super.init(coder: aDecoder)
//        let fontname = self.titleLabel?.font.fontName
//        let fontsize =  self.titleLabel?.font.pointSize.fontSIZE()
//        self.titleLabel?.font = UIFont(name: fontname!, size: fontsize!)!
//
//    }
// }


/**
 Custom Button to set corner radius border,border width and border color of Button
 */
class MSButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) { super.init(coder: aDecoder)!
        let fontname = self.titleLabel?.font.fontName
        let fontsize =  self.titleLabel?.font.pointSize.fontSIZE()
        self.titleLabel?.font = UIFont(name: fontname!, size: fontsize!)!
        
        if self.titleLabel?.text != nil {
            self.setTitle(NSLocalizedString((self.titleLabel?.text)!, comment: ""), for: .normal)
        }else {
            self.setTitle(self.titleLabel?.text, for: .normal)
        }
        
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var shadowColor: UIColor? {
        didSet {
            layer.shadowColor = shadowColor?.cgColor
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 1.0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var masksToBounds: Bool = true {
        didSet {
            layer.masksToBounds = masksToBounds
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize.zero {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
    @IBInspectable open var characterSpacing:CGFloat = 1 {
            didSet {
                
                let attributedString = NSMutableAttributedString(string: self.title(for: .normal)!)
                attributedString.addAttribute(NSAttributedStringKey.kern, value: self.characterSpacing, range: NSRange(location: 0, length: attributedString.length))
                self.setAttributedTitle(attributedString, for: .normal)
            }
            
        }
    
}
