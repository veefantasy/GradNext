//
//  commonMethods.swift
//  Mk
//
//  Created by Muthu Kumar M on 1/27/17.
//  Copyright © 2017 . All rights reserved.
//

import UIKit
import MBProgressHUD

class commonMethods: NSObject {

    
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
extension UIViewController {
    
    func alert(title: String?, message: String?, buttonTitle: String = "OK") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: { action in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}
extension UIView
{
    func showLoader()
    {
        let loadingNotification = MBProgressHUD.showAdded(to: self, animated: true)
        loadingNotification.mode = MBProgressHUDMode.indeterminate
        loadingNotification.bezelView.style = .solidColor // you should change the bezelview style to solid color.
        
        loadingNotification.label.text = "Loading"
    }
    func hideLoader()
    {
        MBProgressHUD.hide(for: self, animated: true)

    }
}
