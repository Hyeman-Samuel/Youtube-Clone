//
//  HomeViewController.swift
//  YoutubeClone
//
//  Created by Samuel Hyeman on 17/06/2020.
//  Copyright © 2020 Samuel Hyeman. All rights reserved.
//

import UIKit

class HomeViewController: UINavigationController {
    var navBarHeight = CGFloat()
    let collectionViews = CollectionViews()
    var filterCollection : UICollectionView?
    var videoCollection : UICollectionView?
    var filterTopConstraint = NSLayoutConstraint()
    let NavBar = CustomNavigationBar().NavBar
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        filterCollection = collectionViews.createFilterCollection()
        videoCollection = collectionViews.createVideoCollection()
          ///Assigns Video delegate to Main controller
        let videoDelegate = videoCollection?.delegate as? VideoViewDelegateHandler      
        videoDelegate?.delegate = (parent as? FirstPageController).self
        view.addSubview(NavBar)
        view.addSubview(filterCollection!)
        view.addSubview(videoCollection!)
        
        SetAutoLayout()
        videoDelegate?.Navs = [filterTopConstraint]
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    
    
    
     
    func SetAutoLayout() {
        
        filterCollection?.translatesAutoresizingMaskIntoConstraints = false
        filterTopConstraint = filterCollection!.topAnchor.constraint(equalTo: NavBar.bottomAnchor)
        filterTopConstraint.isActive = true
        filterCollection?.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        filterCollection?.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        filterCollection?.heightAnchor.constraint(equalToConstant: navBarHeight * 0.7).isActive = true

       videoCollection?.translatesAutoresizingMaskIntoConstraints = false
       videoCollection?.topAnchor.constraint(equalTo: filterCollection!.bottomAnchor).isActive = true
       videoCollection?.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
       videoCollection?.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
       videoCollection?.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
               
       NavBar.translatesAutoresizingMaskIntoConstraints = false
       NavBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
       NavBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
       NavBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
       NavBar.heightAnchor.constraint(equalToConstant:navBarHeight).isActive = true
       
        
    }
    

}
