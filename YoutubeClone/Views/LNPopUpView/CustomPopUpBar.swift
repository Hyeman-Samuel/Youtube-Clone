//
//  CustomPopUpBar.swift
//  YoutubeClone
//
//  Created by Samuel Hyeman on 30/06/2020.
//  Copyright © 2020 Samuel Hyeman. All rights reserved.
//

import UIKit
import LNPopupController
import VersaPlayer

class YTPopUpBar: LNPopupCustomBarViewController {
    var activity:UIActivityIndicatorView = {
       let View = UIActivityIndicatorView()
        View.hidesWhenStopped = true
        View.color = .white
        return View
    }()
    var controls : VersaMiniPlayerControls?
    var videoTitle = UILabel()
    var channel = UILabel()
    init(player:VersaPlayerView) {
        super.init(nibName: nil, bundle: nil)
        controls = player.controls as? VersaMiniPlayerControls
        preferredContentSize = CGSize(width: view.frame.width, height: 55)
        player.backgroundColor = .black
        view.addSubview(player)
        player.translatesAutoresizingMaskIntoConstraints = false
        player.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        player.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        player.widthAnchor.constraint(equalToConstant: view.frame.width * 0.4).isActive = true
        player.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        
        player.addSubview(activity)
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.centerYAnchor.constraint(equalTo: player.centerYAnchor).isActive = true
        activity.centerXAnchor.constraint(equalTo: player.centerXAnchor).isActive = true
        activity.widthAnchor.constraint(equalToConstant: 10).isActive = true
        activity.heightAnchor.constraint(equalToConstant: 10).isActive = true
        activity.startAnimating()
        videoTitle.font = .boldSystemFont(ofSize: 11)
        channel.font = .boldSystemFont(ofSize: 9)
        channel.textColor = .darkGray
         let description = UIStackView(arrangedSubviews: [videoTitle,channel])
         description.axis = .vertical
        description.alignment = .leading
        description.distribution = .fillEqually
        view.addSubview(description)
        description.translatesAutoresizingMaskIntoConstraints = false
        description.leftAnchor.constraint(equalTo: player.rightAnchor,constant: 5).isActive = true
        description.topAnchor.constraint(equalTo: view.topAnchor,constant: 0).isActive = true
        description.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -5).isActive = true
        description.widthAnchor.constraint(equalToConstant: view.frame.width * 0.3).isActive = true
        
        let controlButtons = UIStackView(arrangedSubviews: [controls!.pause, controls!.cancel])
        controlButtons.axis = .horizontal
        controlButtons.alignment = .center
        controlButtons.distribution = .fillEqually
        view.addSubview(controlButtons)
        controlButtons.translatesAutoresizingMaskIntoConstraints = false
        controlButtons.leftAnchor.constraint(equalTo: description.rightAnchor).isActive = true
        controlButtons.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        controlButtons.widthAnchor.constraint(equalToConstant: view.frame.width * 0.3).isActive = true
        controlButtons.heightAnchor.constraint(equalToConstant: view.frame.height).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    
    override func popupItemDidUpdate() {
        super.popupItemDidUpdate()
    
}
}
