//
//  Utilities.swift
//  GradNext
//
//  Created by Aravind on 4/23/17.
//  Copyright © 2017 swathi. All rights reserved.
//

import UIKit

class Utilities: NSObject {
    class func setTextFieldBorderBelow(forTextField textField : UITextField,color: UIColor) {
        let borderWidth     = CGFloat(2.0)
        let border          = CALayer()
        border.borderColor  = color.cgColor
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
    class func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    class func isValideNumber(number: String) -> Bool
    {
        let numberFormat = "[789][0-9]{9}"
        let numberTest = NSPredicate(format:"SELF MATCHES %@", numberFormat)
        return numberTest.evaluate(with: number)
    }
    
    class func hasConnectivity() -> Bool {
        let reachability: Reachability = Reachability.forInternetConnection()
        let networkStatus: Int = reachability.currentReachabilityStatus().rawValue
        return networkStatus != 0
    }
    
    
    class func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    
}
