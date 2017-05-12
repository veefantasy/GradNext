//
//  SigninViewController
//  GradNext
//
//  Created by Muthu Kumar on 09/06/16.
//  Copyright © 2017 Mk. All rights reserved.
//

import UIKit
import Alamofire
import AlertBar
class SigninViewController: UIViewController {

    @IBOutlet weak var SignInButton: UIButton!
    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        NotificationCenter.default.addObserver(self, selector: #selector(JoinNowViewController.methodOfReceivedNotification(notification:)), name: Notification.Name("NotificationIdentifier"), object: nil)
        
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
    }

    @IBAction func signInButtonClicked(_ sender: Any) {
        
//        
//        var messageString = "";
//        var value  = false
//        
//        if(userNameTxtField.text == "")
//        {
//            messageString = "Please enter your first Name"
//            SignInButton.isEnabled  = value
//            AlertBar.show(.info, message: messageString)
//            
//            userNameTxtField.becomeFirstResponder()
//        }
//        else if(passwordTxtField.text == "")
//        {
//            messageString = "Please enter your last Name "
//            SignInButton.isEnabled  = value
//            AlertBar.show(.info, message: messageString)
//            passwordTxtField.becomeFirstResponder()
//        }
//            
//            
//        else
//        {
//            if(Utilities.hasConnectivity())
//            {
//                self.view.showLoader()
//                
//                Alamofire.request("http://service.gradnext.com/swagger/ui/index#!/User/User_SignInUser", method: .post, parameters: ["EmailId":userNameTxtField.text!,"PasswordDesc": passwordTxtField.text!,]).responseJSON{ (responseData) -> Void in
//                    if((responseData.result.value) != nil) {
//                        
//                        self.view.hideLoader()
//                    }
//                    else
//                    {
//                        self.view.hideLoader()
//                    }
//                    value = true
//                    self.userNameTxtField.text = "";
//                    self.passwordTxtField.text = "";
//                   
//                    
//                    messageString = "Your message was sent successfully. Thanks."
//                    self.view.endEditing(true)
//                    self.SignInButton.isEnabled  = value
//                    AlertBar.show(.info, message: messageString)
//                }
//            }
//            else
//            {
//                alert(title: "No InternetConnection", message: "Internet connection appears to be offline", buttonTitle: "Ok")
//                
//                self.SignInButton.isEnabled  = true
//            }
//        }
//        
//        

        
        
        
        
        self.performSegue(withIdentifier: "loginToCandidateProfile", sender: nil)
    }
    func methodOfReceivedNotification(notification: NSNotification){
        //Take Action on Notification
        self.SignInButton.isEnabled  = true
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
