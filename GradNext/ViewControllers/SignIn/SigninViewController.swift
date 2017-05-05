//
//  SigninViewController
//  GradNext
//
//  Created by Muthu Kumar on 09/06/16.
//  Copyright © 2017 Mk. All rights reserved.
//

import UIKit
import Alamofire

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
        
        
        Alamofire.request("http://gradnext.phoenixlab.in/api/", method: .post, parameters: ["name":"", "email": "","subject":"","mobileNo":"123333","address":"adyar","RequestDate":"today","message":""]).responseJSON{ (responseData) -> Void in
            if((responseData.result.value) != nil) {
                
            }
            else
            {
            }
         
        }

        
    }
    
    override func viewDidLayoutSubviews()
    {
        
        Utilities.setTextFieldBorderBelow(forTextField: passwordTxtField)
        Utilities.setTextFieldBorderBelow(forTextField: userNameTxtField)
    }

    @IBAction func signInButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "loginToCandidateProfile", sender: nil)
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
