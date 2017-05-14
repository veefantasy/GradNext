//
//  LeftViewController.swift
//  GradNext
//
//  Created by Muthu Kumar M on 5/13/17.
//  Copyright © 2017 swathi. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {

    var menus = ["Company Profile","Messages","Manage Subscription","Notificaitons","Settings","Logout"]
    @IBOutlet weak var leftTableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if (indexPath.row  == 0 )
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! TableViewCell
            cell.userImageView.image = UIImage(named : "")
            cell.nameLabel.text =  "Simmons"
            cell.companyLabel.text =  "Hcl Technologies"
            cell.userImageView.image = UIImage(named : "UserPic")
            cell.nameLabel?.textColor =  UIColor.white
            cell.companyLabel?.textColor =  UIColor.white
            cell.backgroundColor = Utilities.UIColorFromRGB(rgbValue: 0x242424)

            return cell

        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! TableViewCell
            cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
            cell.textLabel?.font = UIFont(name: "HelveticaNeue", size: 16)
            cell.textLabel?.text = menus[indexPath.row]
            cell.textLabel?.textColor =  UIColor.white

            cell.imageView?.image = UIImage(named: "LeftIcon")
            cell.imageView?.layer.masksToBounds = true
            cell.imageView?.layer.cornerRadius = 20
            cell.backgroundColor = Utilities.UIColorFromRGB(rgbValue: 0x242424)

            return cell

        }
    }
    
}


