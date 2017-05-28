//
//  LeftViewController.swift
//  GradNext
//
//  Created by Muthu Kumar M on 5/13/17.
//  Copyright © 2017 swathi. All rights reserved.
//

import UIKit
import Alamofire
class LeftViewController: UIViewController {

    var menus = ["My Profile","Messages","Notificaitons","Settings","Logout"]
    var menusImage = ["menu_candidateprofile","menu_message","menu_notification","menu_settings","menu_logout"]

    
    var companymenus = ["Company Profile","Messages","Manage Subscription","Notificaitons","Settings","Logout"]

     var companymenusImage = ["menu_candidateprofile","menu_message","menu_message","menu_notification","menu_settings","menu_logout"]

    @IBOutlet weak var leftTableView: UITableView!

    //Final
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor.white
        
    SharedManager.sharedInstance.userLabelText  =   UserDefaults.standard.value(forKey: "UserLabel") as! String?
        
        SharedManager.sharedInstance.sessionID  =   UserDefaults.standard.value(forKey: "SessionId") as! String?

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

    func logout()
    {
        let parameters: [String: String] = ["SessionId":SharedManager.sharedInstance.sessionID! ]
        
        let url = URL(string: "http://service.gradnext.com/api/User/SignoutUser")!
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
                    
                    print(value)
                    
                    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    appDelegate.window?.rootViewController =  appDelegate.LandingView()

                                        
                }
            case .failure(let error):
                print(error)
            }
            
            
        }
        
    }
    
    
}
extension LeftViewController : UITableViewDelegate {
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        logout()

        if ((UserDefaults.standard.value(forKey: "UserOption") as! String) == "CAND")
        {            print("Candidate World")
        
            
        }
        else{
            
            print("company World")

        }
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
        

        
        if ((UserDefaults.standard.value(forKey: "UserOption") as! String) == "CAND")
        {
            return menus.count+1

        }
        else
        {
            return companymenus.count+1

        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        if (indexPath.row  == 0 )
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell", for: indexPath) as! TableViewCell
            cell.userImageView.image = UIImage(named : "")
            
            if let userName = SharedManager.sharedInstance.userLabelText
            {
                cell.nameLabel.text =  userName
                cell.companyLabel.text =  SharedManager.sharedInstance.userDetailLabelText!
            }
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
            
            if ((UserDefaults.standard.value(forKey: "UserOption") as! String) == "CAND")
            {
                cell.menuLabel?.text = menus[indexPath.row-1]
                cell.iconImageView.image = UIImage(named: menusImage[indexPath.row-1])
            }
            else
            {
                cell.menuLabel?.text = companymenus[indexPath.row-1]
                cell.iconImageView.image = UIImage(named: companymenusImage[indexPath.row-1])
            }
            cell.menuLabel?.textColor =  UIColor.white
            cell.iconImageView?.layer.masksToBounds = true
            cell.iconImageView?.layer.cornerRadius = 20
            cell.backgroundColor = Utilities.UIColorFromRGB(rgbValue: 0x242424)

            return cell

        }
    }
    
}



