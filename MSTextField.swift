//
//  MSFloatingTextField.swift
//
//  Created by Mahipal on 07/05/18.
//  Copyright © 2018 Mahipal Singh. All rights reserved.
//

import Foundation
import UIKit
//import SkyFloatingLabelTextField //add in pod
/**
 MSFloatingTextField show floating animation of placeholder and text in textfield
 */
/*
class MSFloatingTextField: SkyFloatingLabelTextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        let fontname = self.font?.fontName
        let fontsize = self.font?.pointSize.fontSIZE()
        self.font = UIFont(name: fontname!, size: fontsize!)
        self.titleFont = self.font!
        self.titleLabel.font = UIFont(name: fontname!, size: (self.font?.pointSize.fontSIZE())!-4.0)
        
    }
}*/

/**  inherating UITextField for further functionlity*/
class MSTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        let fontname = self.font?.fontName
        let fontsize = self.font?.pointSize.fontSIZE()
        self.font = UIFont(name: fontname!, size: fontsize!)
        self.text = NSLocalizedString(self.text!, comment: "")
        self.placeholder = NSLocalizedString(self.placeholder!, comment: "")
        
    }
    
}

extension UITextField {
    @IBInspectable var placeholderColor: UIColor {
        get {
            return attributedPlaceholder?.attribute(.foregroundColor, at: 0, effectiveRange: nil) as? UIColor ?? .clear
        }
        set {
            guard let attributedPlaceholder = attributedPlaceholder else { return }
            let attributes: [NSAttributedStringKey: UIColor] = [.foregroundColor: newValue]
            self.attributedPlaceholder = NSAttributedString(string: attributedPlaceholder.string, attributes: attributes)
        }
    }
}
