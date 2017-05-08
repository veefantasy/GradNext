//
//  JoinNowViewController.swift
//  GradNext
//
//  Created by Muthu Kumar on 09/06/16.
//  Copyright © 2016 Mk. All rights reserved.
//

import UIKit
import Alamofire
import AlertBar
class JoinNowViewController: UIViewController {

    @IBOutlet weak var firstNameTxtField: UITextField!
    
    @IBOutlet weak var lastNameTxtField: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var termsLabel: UILabel!
    @IBOutlet weak var emailTxtField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        NotificationCenter.default.addObserver(self, selector: #selector(JoinNowViewController.methodOfReceivedNotification(notification:)), name: Notification.Name("NotificationIdentifier"), object: nil)
        
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
    /*
 
     {
     
     "UserFirstName": "sara",
     "UserLastName": "raj",
     "EmailId": "testlab7027@gmail.com",
     "MobileNumber": "9788768693",
     "UserOptionCode": "CAND",
     "AddressLine1": "GUINDY",
     "AddressLine2": "CHENNAI",
     "SuburbName": "TN",
     "StateName": "TN",
     "CountryName": "INDIA",
     "PostCode": "600028",
     "PasswordDesc": "123",
     }
*/
    @IBAction func SignUp(_ sender: Any) {
        

        var messageString = "";
        var value  = false
        
        if(firstNameTxtField.text == "")
        {
            messageString = "Please enter your first Name"
            submitButton.isEnabled  = value
            AlertBar.show(.info, message: messageString)
            
            firstNameTxtField.becomeFirstResponder()
        }
        else if(lastNameTxtField.text == "")
        {
            messageString = "Please enter your last Name "
            submitButton.isEnabled  = value
            AlertBar.show(.info, message: messageString)
            lastNameTxtField.becomeFirstResponder()
        }
        else if(emailTxtField.text == "")
        {
            messageString = "Please enter your Email-id"
            submitButton.isEnabled  = value
            AlertBar.show(.info, message: messageString)
            
            emailTxtField.becomeFirstResponder()
            
        }
        else if((commonMethods.isValidEmail(testStr :emailTxtField.text! as String)) == false)
        {
            messageString = "Please enter a valid Email-id"
            submitButton.isEnabled  = value
            AlertBar.show(.info, message: messageString)
            
            emailTxtField.becomeFirstResponder()
        }
        else if(mobileTextField.text == "")
        {
            messageString = "Please enter your mobile number"
            submitButton.isEnabled  = value
            AlertBar.show(.info, message: messageString)
            
            mobileTextField.becomeFirstResponder()
        }
            
       
        else
        {
            if(commonMethods.hasConnectivity())
            {
                self.view.showLoader()
                
                Alamofire.request("http://service.gradnext.com/swagger/ui/index#!/User/User_RegisterUser", method: .post, parameters: ["UserFirstName":firstNameTxtField.text!,"UserLastName": lastNameTxtField.text!, "EmailId": emailTxtField.text!,"MobileNumber":mobileTextField.text!,"UserOptionCode":"CAND",]).responseJSON{ (responseData) -> Void in
                    if((responseData.result.value) != nil) {
                        
                        self.view.hideLoader()
                    }
                    else
                    {
                        self.view.hideLoader()
                    }
                    value = true
                    self.emailTxtField.text = "";
                    self.lastNameTxtField.text = "";
                    self.firstNameTxtField.text = "";
                    self.mobileTextField.text = "";


                    messageString = "Your message was sent successfully. Thanks."
                    self.view.endEditing(true)
                    self.submitButton.isEnabled  = value
                    AlertBar.show(.info, message: messageString)
                }
            }
            else
            {
                alert(title: "No InternetConnection", message: "Internet connection appears to be offline", buttonTitle: "Ok")
                
                self.submitButton.isEnabled  = true
            }
        }

        
        
        
        
        
        
        
        
        
//        
//        Alamofire.request("http://service.gradnext.com/swagger/ui/index#!/User/User_SignInUser", method: .post, parameters: ["UserFirstName":firstNameTxtField.text!,"UserLastName": lastNameTxtField.text!, "EmailId": emailTxtField.text!,"MobileNumber":mobileTextField.text!,"UserOptionCode":"CAND",]).responseJSON{ (responseData) -> Void in
//            if((responseData.result.value) != nil) {
//                
//                
//                print(responseData.result.value!)
//            }
//            else
//            {
//                print(Error.self)
//            }
//            
//        }
        


        
        
    }
    
    func methodOfReceivedNotification(notification: NSNotification){
        //Take Action on Notification
        submitButton.isEnabled  = true
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
    //        Alamofire.request("http://service.gradnext.com/swagger/ui/index#!/User/User_SignInUser", method: .post, parameters: ["UserFirstName":"Mk","UserLastName": "kumar", "EmailId": "muthukumar.test@gmail.com","MobileNumber":"9500172887","UserOptionCode":"CAND",]).responseJSON{ (responseData) -> Void in
    //            if((responseData.result.value) != nil) {
    //
    //
    //                print(responseData.result.value!)
    //            }
    //            else
    //            {
    //                print(Error.self)
    //            }
    //            
    //        }
}
