//
//  ExploreViewController.swift
//  GradNext
//
//  Created by Muthu Kumar M on 5/27/17.
//  Copyright © 2017 swathi. All rights reserved.
//

import UIKit

class ExploreViewController: UIViewController ,UIScrollViewDelegate{

    
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var RightButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    let scrollView  = UIScrollView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: self.view.frame.size.width, height: 44))
        self.view.addSubview(navBar);
        let navItem = UINavigationItem(title: "GradNext");
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: nil, action: #selector(getter: UIAccessibilityCustomAction.selector));
        
        let leftItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.bookmarks, target: nil, action: #selector(getter: UIAccessibilityCustomAction.selector));

        
        navItem.leftBarButtonItem = leftItem;
        navBar.setItems([navItem], animated: false)
        
       self.title = "Home"
//        self.navigationController?.navigationBar.topItem?.title = "GradNext";
        
        scrollView.frame =  CGRect(x: 0, y: headerView.frame.origin.y+headerView.frame.size.height, width: self.view.frame.size.width, height: self.view.frame.size.height-headerView.frame.origin.y+headerView.frame.size.height)
        scrollView.isPagingEnabled = true
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: self.view.frame.size.width*2, height:self.view.frame.size.height-headerView.frame.origin.y+headerView.frame.size.height)
        self.view.addSubview(scrollView)
        
        for  i in 0...1
        {
            
            let homeView   = UIView(frame: CGRect(x: self.view.frame.size.width * CGFloat(i), y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height-headerView.frame.origin.y+headerView.frame.size.height))
            homeView.backgroundColor = UIColor.white
            scrollView.addSubview(homeView)
        }
        
        
        self.setNavigationBarItem(controllerName: "Home")

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView)    {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
