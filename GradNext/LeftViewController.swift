//
//  LeftViewController.swift
//  GradNext
//
//  Created by Muthu Kumar M on 5/13/17.
//  Copyright © 2017 swathi. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {

    var menus = ["Candidate Profile","Messages","Manage Subscription","Notificaitons","Settings","Logout"]
    
    var menusImage = ["menu_candidateprofile","menu_message","menu_message","menu_notification","menu_settings","menu_logout"]

    @IBOutlet weak var leftTableView: UITableView!

    //Final
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        
    SharedManager.sharedInstance.userLabelText  =   UserDefaults.standard.value(forKey: "UserLabel") as! String?
    SharedManager.sharedInstance.userDetailLabelText =  UserDefaults.standard.value(forKey: "UserDetailLabel") as! String?
        
    self.view.backgroundColor = Utilities.UIColorFromRGB(rgbValue: 0x242424)
    self.leftTableView.tableFooterView = UIView(frame: CGRect.zero)
 self.leftTableView.backgroundColor =  Utilities.UIColorFromRGB(rgbValue: 0x242424)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
extension LeftViewController : UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            print("Hello World")
        
    }
    
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
  {
    
    if (indexPath.row == 0){
        
        return 100
    }
    else
    {
        return 70
    }
 
    }
}
extension LeftViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return menus.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if (indexPath.row  == 0 )
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! TableViewCell
            cell.userImageView.image = UIImage(named : "")
            cell.nameLabel.text =  SharedManager.sharedInstance.userLabelText!
            cell.companyLabel.text =  SharedManager.sharedInstance.userDetailLabelText!
            cell.userImageView.image = UIImage(named : "UserPic")
            cell.nameLabel?.textColor =  UIColor.white
            cell.companyLabel?.textColor =  UIColor.white
            cell.backgroundColor = Utilities.UIColorFromRGB(rgbValue: 0x242424)

            return cell

        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! TableViewCell
            cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 16)
            cell.menuLabel?.text = menus[indexPath.row-1]
            cell.menuLabel?.textColor =  UIColor.white

           cell.iconImageView.image = UIImage(named: menusImage[indexPath.row-1])
            cell.iconImageView?.layer.masksToBounds = true
            cell.iconImageView?.layer.cornerRadius = 20
            cell.backgroundColor = Utilities.UIColorFromRGB(rgbValue: 0x242424)

            return cell

        }
    }
    
}


