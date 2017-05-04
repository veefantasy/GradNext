//
//  Utilities.swift
//  GradNext
//
//  Created by Aravind on 4/23/17.
//  Copyright © 2017 swathi. All rights reserved.
//

import UIKit

class Utilities: NSObject {
    class func setTextFieldBorderBelow(forTextField textField : UITextField) {
        let borderWidth     = CGFloat(2.0)
        let border          = CALayer()
        border.borderColor  = UIColor.white.cgColor
        border.borderWidth  = borderWidth
        border.frame        = CGRect(x: 0, y: textField.frame.size.height - borderWidth, width: textField.frame.size.width, height: borderWidth)
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }
    
    
    class func setTextFieldCornerRadius(forTextField : UITextField,withRadius : Float, withBorderColor : UIColor) {
        forTextField.layer.cornerRadius = CGFloat(withRadius)
        forTextField.layer.borderWidth = 1.0
        forTextField.layer.borderColor = withBorderColor.cgColor
    }
    
}
