//
//  VersaCustomControls.swift
//  YoutubeClone
//
//  Created by Samuel Hyeman on 08/07/2020.
//  Copyright © 2020 Samuel Hyeman. All rights reserved.
//

import Foundation
import VersaPlayer

class VersaCustomControls: VersaPlayerControls {
     let pause = VersaStatefulButton()
    let seekbar = VersaSeekbarSlider()
    let totaltime = VersaTimeLabel()
    let currenTime = VersaTimeLabel()
    let fullScreen = VersaStatefulButton()
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        
        self.seekbarSlider = seekbar
        self.addSubview(seekbar)
        seekbar.tintColor = .red
        
        self.currentTimeLabel = currenTime
        self.addSubview(currenTime)
        currenTime.textColor = .lightGray
        currenTime.font = .boldSystemFont(ofSize: 14)
        
        self.totalTimeLabel = totaltime
        self.addSubview(totaltime)
        totaltime.textColor = .lightGray
        totaltime.font = .boldSystemFont(ofSize: 14)

        self.playPauseButton = pause
        self.addSubview(pause)
        setPlayPauseButton()
        
        self.fullscreenButton = fullScreen
        self.addSubview(fullScreen)
        setFullScreenButton()
       
        SetLayout()
        
        
    }
    
    func SetLayout() {
        pause.translatesAutoresizingMaskIntoConstraints = false
        pause.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        pause.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        pause.widthAnchor.constraint(equalToConstant: 50).isActive = true
        pause.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        seekbar.translatesAutoresizingMaskIntoConstraints = false
        seekbar.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: seekbar.frame.height/2.1).isActive = true
        seekbar.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        seekbar.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        totaltime.translatesAutoresizingMaskIntoConstraints = false
        totaltime.leftAnchor.constraint(equalTo: currenTime.rightAnchor,constant:5).isActive = true
        totaltime.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant:-20).isActive = true
        
        currenTime.translatesAutoresizingMaskIntoConstraints = false
        currenTime.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 10).isActive = true
        currenTime.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant:-20).isActive = true
        
        fullScreen.translatesAutoresizingMaskIntoConstraints = false
        fullScreen.rightAnchor.constraint(equalTo: self.rightAnchor,constant:-10).isActive = true
        fullScreen.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant:-20).isActive = true
        
    }
    
   func setPlayPauseButton(){
        let pauseButton = UIImage(systemName: "pause.fill")
       pauseButton?.withTintColor(.white)
       let playButton = UIImage(systemName: "play.fill")
       pauseButton?.withTintColor(.white)
       pause.activeImage = pauseButton
       pause.inactiveImage = playButton
       pause.tintColor = .white
    }
    func setFullScreenButton(){
         let returnView = UIImage(systemName: "viewfinder")
               returnView?.withTintColor(.white)
               fullScreen.activeImage = returnView
               fullScreen.inactiveImage = returnView
               fullScreen.tintColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
