//
//  CandidateProfileViewController.swift
//  GradNext
//
//  Created by Aravind on 5/5/17.
//  Copyright © 2017 swathi. All rights reserved.
//

import UIKit

class CandidateProfileViewController: UIViewController {
    @IBOutlet weak var lblAustralia: UITextField!
    
    @IBOutlet weak var lblState: UITextField!
    @IBOutlet weak var lblSuburb: UITextField!
    @IBOutlet weak var lblPostCode: UITextField!
    @IBOutlet weak var lblAddress: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
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
        Utilities.setTextFieldCornerRadius(forTextField: firstName, withRadius: 3.0, withBorderColor: UIColor.gray)
        Utilities.setTextFieldCornerRadius(forTextField: lastName, withRadius: 3.0, withBorderColor: UIColor.gray)
        Utilities.setTextFieldCornerRadius(forTextField: lblAddress, withRadius: 3.0, withBorderColor: UIColor.gray)
        Utilities.setTextFieldCornerRadius(forTextField: lblPostCode, withRadius: 3.0, withBorderColor: UIColor.gray)
        Utilities.setTextFieldCornerRadius(forTextField: lblSuburb, withRadius: 3.0, withBorderColor: UIColor.gray)
        Utilities.setTextFieldCornerRadius(forTextField: lblState, withRadius: 3.0, withBorderColor: UIColor.gray)
        Utilities.setTextFieldCornerRadius(forTextField: lblAustralia, withRadius: 3.0, withBorderColor: UIColor.gray)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
