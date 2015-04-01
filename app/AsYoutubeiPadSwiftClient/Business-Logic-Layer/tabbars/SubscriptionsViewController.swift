//
//  SubscriptionsViewController.swift
//  AsYoutubeiPadSwiftClient
//
//  Created by djzhang on 3/15/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import UIKit



class SubscriptionsViewController: FrontBaseViewController {
    
    @IBOutlet var container: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let channelPageViewController: ChannelPageViewController = ChannelPageViewController()
        
        channelPageViewController.view.frame = container.bounds
        
        container.addSubview(channelPageViewController.view)
    }
    
    func test(){
        
        let button:UIButton = UIButton()
        button.setTitle("wanghao", forState: .Normal)
        button.setTitleColor(UIColor.redColor(), forState: .Normal)
        button.frame = CGRectMake(100, 100, 200, 44)
        
        //        self.view.addSubview(button)
        
        
        var tabBarItemsController: UIViewController =
        self.storyboard!.instantiateViewControllerWithIdentifier("YTTabBarItemsViewController") as UIViewController
        
        
        let headerView:UIView = UIView()
        headerView.frame = CGRectMake(0, 100, self.view.frame.size.width, 44)
        headerView.addSubview(tabBarItemsController.view)
        
        //        self.view.addSubview(headerView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
}