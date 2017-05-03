//
//  SigninViewController
//  GradNext
//
//  Created by Muthu Kumar on 09/06/16.
//  Copyright © 2017 Mk. All rights reserved.
//

import UIKit


class SigninViewController: UIViewController {

    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        userNameTxtField.attributedPlaceholder = NSAttributedString(string: "User Name",
                                                                    attributes: [NSForegroundColorAttributeName: UIColor.lightGray])
        
        passwordTxtField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                    attributes: [NSForegroundColorAttributeName: UIColor.lightGray])
        
    }
    
    override func viewDidLayoutSubviews()
    {
        
        Utilities.setTextFieldBorderBelow(forTextField: passwordTxtField)
        Utilities.setTextFieldBorderBelow(forTextField: userNameTxtField)
//        let borderWidth     = CGFloat(2.0)
//        var border          = CALayer()
//        border.borderColor  = UIColor.white.cgColor
//        border.borderWidth  = borderWidth
//       
//        border.frame        = CGRect(x: 0, y: passwordTxtField.frame.size.height - borderWidth, width: passwordTxtField.frame.size.width, height: borderWidth)
//        
//        passwordTxtField.layer.addSublayer(border)
//        passwordTxtField.layer.masksToBounds = true
//        
//        border              = CALayer()
//        border.borderColor  = UIColor.white.cgColor
//        border.borderWidth  = borderWidth
//        border.frame        = CGRect(x: 0, y: userNameTxtField.frame.size.height - borderWidth, width: userNameTxtField.frame.size.width, height: borderWidth)
//        
//        userNameTxtField.layer.addSublayer(border)
//        userNameTxtField.layer.masksToBounds = true
    }

    @IBAction func exitAction(_ sender: AnyObject) {
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
