//
//  VersaMiniPlayerControls.swift
//  YoutubeClone
//
//  Created by Samuel Hyeman on 10/07/2020.
//  Copyright © 2020 Samuel Hyeman. All rights reserved.
//

import Foundation
import VersaPlayer

class VersaMiniPlayerControls: VersaPlayerControls {
    let pause = VersaStatefulButton()
    let cancel = UIButton()
    var parentViewController:VideoPlayerController?
    override init(frame: CGRect) {
        super.init(frame: .zero)
        cancel.addTarget(self, action: #selector(closePopUp), for: .touchUpInside)
        self.playPauseButton = pause
        self.addSubview(pause)
        setPlayPauseButton()
        
        self.addSubview(cancel)
        setCancelButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPlayPauseButton(){
        let pauseButton = UIImage(systemName: "pause.fill")
        //pauseButton?.withTintColor(.black)
       let playButton = UIImage(systemName: "play.fill")
        //pauseButton?.withTintColor(.black)
       pause.activeImage = pauseButton
       pause.inactiveImage = playButton
        pause.tintColor = .black
    }
    
    func setCancelButton(){
        cancel.setImage(UIImage(systemName: "x.square"), for: .normal)
        cancel.tintColor = .black
    }
    @objc func closePopUp(){
        parentViewController?.prevController?.dismissPopupBar(animated: true, completion: nil)
      }
    
}
