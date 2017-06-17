//
//  ExploreViewController.swift
//  GradNext
//
//  Created by Muthu Kumar M on 5/27/17.
//  Copyright © 2017 swathi. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
class ExploreViewController: UIViewController ,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource{

    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var RightButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    let scrollView  = UIScrollView()

    var temp  = 0
     var nameArray = [String]()
    var imageArray = [String]()
     var CompanyName = [String]()
    

   var tableView : UITableView!
    
    @IBAction func SearchJobsAction(_ sender: Any) {
        
        if (((sender as AnyObject).tag) == 0)
        {
            leftButton.backgroundColor = Utilities.UIColorFromRGB(rgbValue: 0xf5f5f5)
            leftButton.setTitleColor(Utilities.UIColorFromRGB(rgbValue: 0x800000), for: .normal)
            
            RightButton.backgroundColor = Utilities.UIColorFromRGB(rgbValue: 0xe33936)
            RightButton.setTitleColor(Utilities.UIColorFromRGB(rgbValue: 0xf5f5f5), for: .normal)
        }
        else
        {
            RightButton.backgroundColor = Utilities.UIColorFromRGB(rgbValue: 0xf5f5f5)
            RightButton.setTitleColor(Utilities.UIColorFromRGB(rgbValue: 0x800000), for: .normal)
            
            leftButton.backgroundColor = Utilities.UIColorFromRGB(rgbValue: 0xe33936)
            leftButton.setTitleColor(Utilities.UIColorFromRGB(rgbValue: 0xf5f5f5), for: .normal)
            
        }
        
        print(self.view.frame.size.width * CGFloat((sender as AnyObject).tag))
        scrollView.setContentOffset(CGPoint(x: self.view.frame.size.width * CGFloat((sender as AnyObject).tag), y: 0),animated: true)

//        gotoLogin()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leftButton.backgroundColor = Utilities.UIColorFromRGB(rgbValue: 0xf5f5f5)
        leftButton.setTitleColor(Utilities.UIColorFromRGB(rgbValue: 0x800000), for: .normal)
        
        RightButton.backgroundColor = Utilities.UIColorFromRGB(rgbValue: 0xe33936)
        RightButton.setTitleColor(Utilities.UIColorFromRGB(rgbValue: 0xf5f5f5), for: .normal)
        
        if(Utilities.hasConnectivity())
        {
//            self.view.showLoader()
            
            let url = URL(string: "http://service.gradnext.com/api/Job/GetAllCompanies?PageNumber=1&RowsPerPage=10")!
            let urlRequest = URLRequest(url: url)
            
            Alamofire.request(urlRequest).responseJSON {
                response in
                switch response.result {
                case .success:
                    
              if let value = response.result.value {
                        
                    let final =  value as! [String : Any]
                    if let result = final["jobs"] as? NSArray {
                            
                        print(result.count)
                        
                        for values in result {
                        
                        if let value = values as? [String:Any] {
                            
                            self.imageArray.append(value["CompanyLogoPath"]! as! String)

                            self.nameArray.append(value["JobTitleName"]! as! String)

                            self.CompanyName.append(value["CompanyName"]! as! String)

                            
                            }
                        }
                        }
              self.tableView?.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: self.view.frame.size.width, height: 44))
        self.view.addSubview(navBar);
        let navItem = UINavigationItem(title: "GradNext");
        let doneItem = UIBarButtonItem(image: UIImage(named:"filter"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.gotoLogin));
        

        let leftItem = UIBarButtonItem(image: UIImage(named:"message"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.gotoLogin))
            
   
           let leftItem1 =  UIBarButtonItem(image: UIImage(named:"ic_notifications_black_24dp"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.gotoLogin))

        
        navItem.leftBarButtonItems = [leftItem,leftItem1];
        
        navItem.rightBarButtonItem = doneItem;

        navBar.setItems([navItem], animated: false)
        
       self.title = "Home"
//        self.navigationController?.navigationBar.topItem?.title = "GradNext";
        
        scrollView.frame =  CGRect(x: 0, y:  headerView.frame.origin.y+headerView.frame.size.height, width: self.view.frame.size.width, height: self.view.frame.size.height-headerView.frame.origin.y+headerView.frame.size.height )
        scrollView.tag = 101
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: self.view.frame.size.width*2, height:self.view.frame.size.height-headerView.frame.origin.y+headerView.frame.size.height)
        self.view.addSubview(scrollView)
        
        for  i in 0...1
        {


             tableView = UITableView()
             tableView.frame = CGRect( x: self.view.frame.size.width * CGFloat(i), y: 0, width: self.view.frame.size.width, height: scrollView.frame.size.height)
            tableView.dataSource  = self
            tableView.delegate = self
            tableView.tag  = i
            tableView.backgroundColor = UIColor.white
            tableView.tableFooterView = UIView(frame: CGRect.zero)
            scrollView.addSubview(tableView)
        }
        
        self.setNavigationBarItem(controllerName: "Home")

        
        // Do any additional setup after loading the view.
    }
    
    func gotoLogin()
    {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController =  appDelegate.LandingView()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)    {
        
        if( scrollView.tag == 101)
        {
        if (scrollView.contentOffset.x == 0)
        {
            leftButton.backgroundColor = Utilities.UIColorFromRGB(rgbValue: 0xf5f5f5)
            leftButton.setTitleColor(Utilities.UIColorFromRGB(rgbValue: 0x800000), for: .normal)
            
            RightButton.backgroundColor = Utilities.UIColorFromRGB(rgbValue: 0xe33936)
            RightButton.setTitleColor(Utilities.UIColorFromRGB(rgbValue: 0xf5f5f5), for: .normal)
        }
        else
        {
            RightButton.backgroundColor = Utilities.UIColorFromRGB(rgbValue: 0xf5f5f5)
            RightButton.setTitleColor(Utilities.UIColorFromRGB(rgbValue: 0x800000), for: .normal)
            
            leftButton.backgroundColor = Utilities.UIColorFromRGB(rgbValue: 0xe33936)
            leftButton.setTitleColor(Utilities.UIColorFromRGB(rgbValue: 0xf5f5f5), for: .normal)
        }
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (tableView.tag == 0)
        {
            return 10
        }
        else{
        
        if(self.nameArray.count > 0)
        {
            return (self.nameArray.count)
        }
        }
        return 0

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 50
    }
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        var cell  = tableView.dequeueReusableCell(withIdentifier: "Cell")
         cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "myIdentifier")

        if( tableView.tag == 0)
        {
        cell?.textLabel?.text = "Hello World"
        }
        
        else
        {
            cell?.textLabel?.text = self.nameArray[indexPath.row]
            // self.imageArray
           // let url = URL(string: "http://service.gradnext.com/\(self.imageArray[indexPath.row])" )
        //    cell?.imageView?.sd_setImage(with: url)
            cell?.detailTextLabel?.text =  self.CompanyName[indexPath.row]
        }
        return  cell!
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
