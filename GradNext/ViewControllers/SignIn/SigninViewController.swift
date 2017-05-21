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
class SigninViewController: UIViewController ,UITextFieldDelegate{
    
    @IBOutlet weak var SignInButton: UIButton!
    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewRememberMe: UIView!
    var activeField: UITextField?
    var rememberMeCheckBox: CheckBox = CheckBox()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(JoinNowViewController.methodOfReceivedNotification(notification:)), name: Notification.Name("NotificationIdentifier"), object: nil)
        
        // Do any additional setup after loading the view.
        
        userNameTxtField.attributedPlaceholder = NSAttributedString(string: "User Name",
                                                                    attributes: [NSForegroundColorAttributeName: UIColor.lightGray])
        
        passwordTxtField.attributedPlaceholder = NSAttributedString(string: "Password",
                                                                    attributes: [NSForegroundColorAttributeName: UIColor.lightGray])
        
        registerForKeyboardNotifications()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        createRememberMeCheckBox()
    }
    override func viewWillDisappear(_ animated: Bool) {
        deregisterFromKeyboardNotifications()
        
    }
    override func viewDidLayoutSubviews()
    {
        Utilities.setTextFieldBorderBelow(forTextField: passwordTxtField,color: UIColor.gray)
        Utilities.setTextFieldBorderBelow(forTextField: userNameTxtField,color: UIColor.gray)
        SignInButton.layer.cornerRadius = 3.0
        
        passwordTxtField.setLeftPaddingPoints(10)
        userNameTxtField.setLeftPaddingPoints(10)
    }
    
    @IBAction func signInButtonClicked(_ sender: Any) {
        
        
        var messageString = "";
        var value  = false
        
        
        print(["EmailId":userNameTxtField.text!,"PasswordDesc": passwordTxtField.text!])
        
        if(userNameTxtField.text == "")
        {
            messageString = "Please enter your first Name"
            SignInButton.isEnabled  = value
            AlertBar.show(.info, message: messageString)
            
            userNameTxtField.becomeFirstResponder()
        }
        else if(passwordTxtField.text == "")
        {
            messageString = "Please enter your last Name "
            SignInButton.isEnabled  = value
            AlertBar.show(.info, message: messageString)
            passwordTxtField.becomeFirstResponder()
        }
        else
        {
            if(Utilities.hasConnectivity())
            {
                self.view.showLoader()
                
                let parameters: [String: String] = ["EmailId":userNameTxtField.text!,"PasswordDesc": passwordTxtField.text!]
                let url = URL(string: "http://service.gradnext.com/api/User/SignInUser")!
                var urlRequest = URLRequest(url: url)
                urlRequest.httpMethod = "POST"
                do {
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                } catch {
                }
                urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
                Alamofire.request(urlRequest).responseJSON {
                    response in
                    switch response.result {
                    case .success:
                        if let value = response.result.value {
                            
                            let final =  value as! [String : Any]
                            
                            if (final["StatusMessage"] as! String == "Login Success")
                            {
                                messageString = ""
                                
                                let UserOptionCode = (final["User"] as? [String: Any])?["UserOptionCode"] as? String
                                
                                print(UserOptionCode!)
                                
                                let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
                                
                                if (UserOptionCode == "CAND")
                                {
                                    appDelegate.window?.rootViewController = appDelegate.createMenuView()
                                }
                                else
                                {
                                    appDelegate.window?.rootViewController = appDelegate.companyMenuView()
                                }
                                
                            }
                            else{
                                AlertBar.show(.info, message: (final["StatusMessage"] as? String)!)
                                
                            }
                            
                        }
                    case .failure(let error):
                        print(error)
                    }
                    
                    self.view.hideLoader()
                    
                    value = true
                    self.userNameTxtField.text = "";
                    self.passwordTxtField.text = "";
                    
                    self.view.endEditing(true)
                    self.SignInButton.isEnabled  = value
                }
            }
            else
            {
                alert(title: "No InternetConnection", message: "Internet connection appears to be offline", buttonTitle: "Ok")
                
                self.SignInButton.isEnabled  = true
            }
        }
        
        
        
        
        
        
        
        //        self.performSegue(withIdentifier: "postJob", sender: nil)
    }
    func methodOfReceivedNotification(notification: NSNotification){
        //Take Action on Notification
        self.SignInButton.isEnabled  = true
    }
    
    func createRememberMeCheckBox()
    {
        rememberMeCheckBox = CheckBox(delegate: self)
        rememberMeCheckBox.frame = CGRect(x: 0, y: 5, width: 160, height: 30)
        rememberMeCheckBox.setTitle("Remember me", for: UIControlState.normal)
        viewRememberMe.addSubview(rememberMeCheckBox)
        
        if UserDefaults.standard.object(forKey: "RememberMe") != nil{
            if UserDefaults.standard.object(forKey: "RememberMe") as! String == "Yes"{
                rememberMeCheckBox.checked = true
                userNameTxtField.text = UserDefaults.standard.object(forKey: "Username") as! String?
                passwordTxtField.text = UserDefaults.standard.object(forKey: "Password") as! String?
            }else{
                rememberMeCheckBox.checked = false
            }
        }
    }
    
    
    @IBAction func exitAction(_ sender: AnyObject) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TextField Delegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    
    func registerForKeyboardNotifications(){
        //Adding notifies on keyboard appearing
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func deregisterFromKeyboardNotifications(){
        //Removing notifies on keyboard appearing
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWasShown(notification: NSNotification){
        //Need to calculate keyboard exact size due to Apple suggestions
        self.scrollView.isScrollEnabled = true
        var info = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize!.height, 0.0)
        
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        
        var aRect : CGRect = self.view.frame
        aRect.size.height -= keyboardSize!.height
        if let activeField = self.activeField {
            if (!aRect.contains(activeField.frame.origin)){
                self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
            }
        }
    }
    
    func keyboardWillBeHidden(notification: NSNotification){
        
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        
    }
    func textFieldDidBeginEditing(_ textField: UITextField){
        // Utilities.setTextFieldCornerRadius(forTextField: textField, withRadius: 3.0, withBorderColor: UIColor.blue)
        // Utilities.setTextFieldBorderBelow(forTextField: textField,color: UIColor.blue)
        
        
        activeField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
        //Utilities.setTextFieldCornerRadius(forTextField: textField, withRadius: 3.0, withBorderColor: UIColor.gray)
        //  Utilities.setTextFieldBorderBelow(forTextField: textField,color: UIColor.gray)
        activeField = nil
    }
    
    
    // MARK: CheckBox Delegate Method
    func didSelectedCheckBox(_ checkbox: CheckBox!, checked: Bool) {
        
        if(checkbox == rememberMeCheckBox){
            if(checked){
                UserDefaults.standard.set("Yes", forKey: "RememberMe")
            }else{
                UserDefaults.standard.set("No", forKey: "RememberMe")
            }
        }
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
