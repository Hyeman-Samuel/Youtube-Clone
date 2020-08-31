//
//  FirstPageController.swift
//  YoutubeClone
//
//  Created by Samuel Hyeman on 01/06/2020.
//  Copyright © 2020 Samuel Hyeman. All rights reserved.
//

import UIKit
import LNPopupController

class FirstPageController: UITabBarController{
    

    var navBarHeight = CGFloat()
    let homeVC = HomeViewController()
    let subscriptionVC = SubscriptionViewController()
    let exploreVC = ExploreViewController()
    let inboxVC = InboxViewController()
    let libraryVC = LibraryViewController()
    var playerVC = VideoPlayerController()
   //SegmentController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setStatusBar(backgroundColor: .white)

        playerVC.prevController = self
        setNavBarHeightForControllers()
        setUpTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
        
}








//MARK: -SetUp Functions


extension FirstPageController{

func setUpTabBar(){
        tabBar.barStyle = .default
        tabBar.barTintColor = .white
        tabBar.tintColor = .red
       homeVC.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "Home"), tag: 0)
       exploreVC.tabBarItem = UITabBarItem(title: "Explore", image: #imageLiteral(resourceName: "Explore"), tag: 1)
       subscriptionVC.tabBarItem =  UITabBarItem(title: "Subscriptions", image: #imageLiteral(resourceName: "Subscriptions"), tag: 2)
       inboxVC.tabBarItem = UITabBarItem(title: "Inbox", image: #imageLiteral(resourceName: "Inbox"), tag: 3)
       libraryVC.tabBarItem = UITabBarItem(title: "Library", image: #imageLiteral(resourceName: "Library"), tag: 4)
        homeVC.tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        exploreVC.tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        subscriptionVC.tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        inboxVC.tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        libraryVC.tabBarItem.imageInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
       let tabBarList = [homeVC,exploreVC,subscriptionVC,inboxVC,libraryVC]
       viewControllers = tabBarList
    }
    

    func setNavBarHeightForControllers() {
        navBarHeight = navigationController!.navigationBar.frame.height + 20
        homeVC.navBarHeight = navBarHeight
        exploreVC.navBarHeight = navBarHeight
        subscriptionVC.navBarHeight = navBarHeight
        inboxVC.navBarHeight = navBarHeight
        libraryVC.navBarHeight = navBarHeight
    }

}









//MARK: -Segment Delegate

extension FirstPageController : VideoPlayerDelegate{
    
    func PlayVideo(video:Video) {
        
      
        
        if playerVC.video == nil {
           self.presentPopupBar(withContentViewController: self.playerVC, openPopup: true, animated: true, completion: nil)
        }else{
            self.openPopup(animated: true, completion: nil)
        }
         playerVC.Start(newVideo: video)
            
            
     }
    
    override func dismissPopupBar(animated: Bool, completion: (() -> Void)? = nil) {
       super.dismissPopupBar(animated: true, completion: nil)
        
        playerVC.playerView.pause()
        playerVC.miniPlayerView.pause()
        
        playerVC.video = nil
    }
     
    
}






//MARK: -STATUSBAR CUSTOMIZATION

extension UINavigationController {

    func setStatusBar(backgroundColor: UIColor) {
        let statusBarFrame: CGRect
        if #available(iOS 13.0, *) {
            statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.tag = 17
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
    }
    
    func hideStatusBar() {
        let statusbar = view.subviews.first(where: { (view) -> Bool in
            return view.tag == 17
        })
        statusbar?.isHidden = true
    }
    
    func showStatusBar() {
        let statusbar = view.subviews.first(where: { (view) -> Bool in
            return view.tag == 17
        })
        statusbar?.isHidden = false
    }

}

