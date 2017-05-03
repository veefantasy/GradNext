//
//  JoinNowViewController.swift
//  GradNext
//
//  Created by Muthu Kumar on 09/06/16.
//  Copyright © 2016 Mk. All rights reserved.
//

import UIKit

class JoinNowViewController: UIViewController {

    @IBOutlet weak var firstNameTxtField: UITextField!
    
    @IBOutlet weak var lastNameTxtField: UITextField!
    
    @IBOutlet weak var termsLabel: UILabel!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        firstNameTxtField.attributedPlaceholder = NSAttributedString(string: "First Name",
                                                                    attributes: [NSForegroundColorAttributeName: UIColor.white])
        
        lastNameTxtField.attributedPlaceholder = NSAttributedString(string: "Last Name",
                                                                    attributes: [NSForegroundColorAttributeName: UIColor.white])
        
        emailTxtField.attributedPlaceholder = NSAttributedString(string: "Email Address",
                                                                    attributes: [NSForegroundColorAttributeName: UIColor.white])
        
        mobileTextField.attributedPlaceholder = NSAttributedString(string: "Mobile Number",
                                                                    attributes: [NSForegroundColorAttributeName: UIColor.white])
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews()
    {
        let borderWidth     = CGFloat(2.0)
        var border          = CALayer()
        border.borderColor  = UIColor.white.cgColor
        border.borderWidth  = borderWidth
        
        border.frame        = CGRect(x: 0, y: firstNameTxtField.frame.size.height - borderWidth, width: firstNameTxtField.frame.size.width, height: borderWidth)
        
        firstNameTxtField.layer.addSublayer(border)
        firstNameTxtField.layer.masksToBounds = true
        
        border              = CALayer()
        border.borderColor  = UIColor.white.cgColor
        border.borderWidth  = borderWidth
        border.frame        = CGRect(x: 0, y: lastNameTxtField.frame.size.height - borderWidth, width: lastNameTxtField.frame.size.width, height: borderWidth)
    
        lastNameTxtField.layer.addSublayer(border)
        lastNameTxtField.layer.masksToBounds = true
        
        border              = CALayer()
        border.borderColor  = UIColor.white.cgColor
        border.borderWidth  = borderWidth
        border.frame        = CGRect(x: 0, y: emailTxtField.frame.size.height - borderWidth, width: emailTxtField.frame.size.width, height: borderWidth)
        
        emailTxtField.layer.addSublayer(border)
        emailTxtField.layer.masksToBounds = true
        
        border              = CALayer()
        border.borderColor  = UIColor.white.cgColor
        border.borderWidth  = borderWidth
        border.frame        = CGRect(x: 0, y: mobileTextField.frame.size.height - borderWidth, width: mobileTextField.frame.size.width, height: borderWidth)
        
        mobileTextField.layer.addSublayer(border)
        mobileTextField.layer.masksToBounds = true
        
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
