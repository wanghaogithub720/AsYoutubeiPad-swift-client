//
//  YTTabBarController.swift
//  AsYoutubeiPadSwiftClient
//
//  Created by djzhang on 3/30/15.
//  Copyright (c) 2015 djzhang. All rights reserved.
//

import Foundation
import Cartography

protocol YTTabBarControllerDelegate  {
    func ytTabBarController(tabBarController: YTTabBarController, shouldSelectViewController viewController: UIViewController) -> Bool
    func ytTabBarController(tabBarController: YTTabBarController, didSelectViewController viewController: UIViewController) -> Bool
}


class YTTabBarController: UIViewController {
    
    var viewControllers:NSDictionary?
    var selectedViewController:UIViewController?
    var selectedIndex:NSInteger = 0
    var delegate:YTTabBarControllerDelegate?
    var tabBarAppearanceSettings:NSDictionary?
    var debug:Bool?
    
    // Mark : Private variables
    var presentationView:UIView?
    var isFirstAppear:Bool?
    
    var tabBarItemsView : UIView?
    var tabBarItemsViewController : YTTabBarItemsViewController?
    var tabBarItemsDictionary:TabBarItemsDictionary?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        var _tabBarItemsViewController: YTTabBarItemsViewController = StoryBoardUtils.getYTTabBarItemsViewController()
        
        let _tabBarItemsView:UIView = _tabBarItemsViewController.view!
//        _tabBarItemsView.frame = CGRectMake(0, 0, self.view.frame.size.width, 44)
        
        tabBarItemsViewController = _tabBarItemsViewController
        tabBarItemsView = _tabBarItemsView
        self.addChildViewController(tabBarItemsViewController!)
        
        tabBarItemsDictionary =  tabBarItemsViewController?.makeTabBarItemsDictionary()
        
        // 2
        presentationView = UIView()
        
        // 3
        self.view.addSubview(_tabBarItemsView)
        self.view.addSubview(presentationView!)
        
        // 4
        layout(tabBarItemsView!) { view1 in
            
            view1.centerX == view1.superview!.centerX

            view1.width   == view1.superview!.width
            view1.height  == TAB_HEIGHT
            
            view1.top == view1.superview!.top
        }
    }
    
    
    override func viewWillAppear(animated: Bool) {
        //         NSParameterAssert(_viewControllers.count > 0);
        
        // Select first view controller on first Launch.
        if(isFirstAppear == false){
            isFirstAppear = true
            //            [self selectViewController:[_viewControllers firstObject]];
            
        }
    }
    
    // Mark : View Controller Selection
    func selectViewController(viewController:UIViewController, withButton button:UIButton) {
        //        tabBarView?.setSelectedButton(button)
        selectViewController(viewController)
    }
    
    func selectViewController(viewController:UIViewController){
        if let presentedView:UIView = presentationView?.subviews.first! as? UIView {
            presentedView.removeFromSuperview()
        }
        
        presentationView?.addSubview(viewController.view)
        fitView(viewController.view, intoView: presentationView!)
    }
    
    func fitView(toPresentView:UIView, intoView containerView:UIView ){
        
    }
    
    
    // Mark : YTTabBarDelegate
    //    func tabBar(tabBar: YTTabBar, didPressButton button: UIButton, atIndex tabIndex:NSInteger){
    //
    //    }
    
    
}