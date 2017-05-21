//
//  UIViewControllerExtension.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/19/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setNavigationBarItem(controllerName : String) {
        self.addLeftBarButtonWithImage(UIImage(named: "ic_menu_black_24dp")!)
        
        if(controllerName ==  "Home" || controllerName == "Application" || controllerName == "My Shortlist"||controllerName == "Manage Job"||controllerName == "Post Job"||controllerName == "Search Talent")
        {
            self.addRightBarButtonWithImage(UIImage(named: "ic_notifications_black_24dp")!)
        }
        else
        {
            self.addRightBarButtonWithTwoImage(UIImage(named: "ic_notifications_black_24dp")!, _HomeImage: UIImage(named: "home")!)
        }
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addLeftGestures()
        self.slideMenuController()?.addRightGestures()
    }
    
    func removeNavigationBarItem() {
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.rightBarButtonItem = nil
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.removeRightGestures()
    }
    
   
    
    
    
}
