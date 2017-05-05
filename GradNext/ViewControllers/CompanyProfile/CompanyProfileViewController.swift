//
//  CompanyProfileViewController.swift
//  GradNext
//
//  Created by Aravind on 5/4/17.
//  Copyright © 2017 swathi. All rights reserved.
//

import UIKit

class CompanyProfileViewController: UIViewController {
    @IBOutlet weak var txtAboutUs: UITextView!
    @IBOutlet weak var txtCompanyName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtPostCode: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtState: UITextField!
    @IBOutlet weak var txtSuburb: UITextField!
    
     @IBOutlet weak var btnCreate: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        customViews()
        // Do any additional setup after loading the view.
    }
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func customViews() {
         Utilities.setTextFieldCornerRadius(forTextField: txtCompanyName, withRadius: 3.0, withBorderColor: UIColor.gray)
         Utilities.setTextFieldCornerRadius(forTextField: txtAddress, withRadius: 3.0, withBorderColor: UIColor.gray)
         Utilities.setTextFieldCornerRadius(forTextField: txtPostCode, withRadius: 3.0, withBorderColor: UIColor.gray)
         Utilities.setTextFieldCornerRadius(forTextField: txtCountry, withRadius: 3.0, withBorderColor: UIColor.gray)
         Utilities.setTextFieldCornerRadius(forTextField: txtState, withRadius: 3.0, withBorderColor: UIColor.gray)
         Utilities.setTextFieldCornerRadius(forTextField: txtSuburb, withRadius: 3.0, withBorderColor: UIColor.gray)
        
        txtAddress.setLeftPaddingPoints(10)
        txtPostCode.setLeftPaddingPoints(10)
        txtCountry.setLeftPaddingPoints(10)
        txtState.setLeftPaddingPoints(10)
        txtSuburb.setLeftPaddingPoints(10)
      
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func createButtonClicked(_ sender: Any) {
        
    }
}

