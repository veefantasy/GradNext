//
//  NotificationsViewController.swift
//  GradNext
//
//  Created by Aravind on 5/21/17.
//  Copyright © 2017 swathi. All rights reserved.
//

import UIKit

class NotificationsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

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
     */ func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
        
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
       
            return 40
            
    
        
    }
    
    func tableView( _ tableView: UITableView, heightForHeaderInSection section: Int ) -> CGFloat
    {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return CGFloat.leastNormalMagnitude
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            var cell = NotificationsTableViewCell()
            cell = tableView.dequeueReusableCell(withIdentifier: "NotificationsTableViewCell")! as! NotificationsTableViewCell
            
            return cell;
         }
    
    
    


}
