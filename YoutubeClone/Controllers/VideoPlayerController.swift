//
//  VideoPlayerController.swift
//  YoutubeClone
//
//  Created by Samuel Hyeman on 29/06/2020.
//  Copyright © 2020 Samuel Hyeman. All rights reserved.
//

import UIKit
import AVFoundation
import VersaPlayer

class VideoPlayerController: UIViewController{
    
    private var  playerItem : VersaPlayerItem?
    private var  miniPlayerItem : VersaPlayerItem?
     var miniPlayerView = VersaPlayerView()

    private let activity : UIActivityIndicatorView = {
    let indicator = UIActivityIndicatorView(style: .medium)
    indicator.hidesWhenStopped = true
    indicator.color = .white
    indicator.startAnimating()
    return indicator
    }()
    private var status = PlayerStatus.Maximized
    var tracks = [VersaPlayerMediaTrack]()
    var YTpopUp:YTPopUpBar?
    var video:Video?
    let versaPlayerControls = VersaCustomControls()
    let versaMiniPlayer = VersaMiniPlayerControls()
    var playerView : VersaPlayerView = {
        let View = VersaPlayerView()
        View.backgroundColor = .black
        return View
    }()
    var prevController:UIViewController?
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .white
        view.addSubview(playerView)
        playerView.addSubview(activity)
        setAutoLayout()
        setControls()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        versaMiniPlayer.parentViewController = self
        playerView.playbackDelegate = self
        miniPlayerView.playbackDelegate = self
    }
    
    
    
    func Start(newVideo:Video){
        setPopUpBar()
        status = .Maximized
        video = newVideo
        YTpopUp?.channel.text = newVideo.user
        YTpopUp?.videoTitle.text = newVideo.title
        if let url = URL.init(string: newVideo.videoLink) {
            playerItem = VersaPlayerItem(url: url)
            miniPlayerItem = VersaPlayerItem(url: url)
            if playerView.player.currentItem != nil {
                playerView.player.replaceCurrentItem(with: playerItem)
                miniPlayerView.player.replaceCurrentItem(with: miniPlayerItem)
            }else{
                playerView.set(item: playerItem)
                miniPlayerView.set(item: miniPlayerItem)
            }
        }else{
            print("url not loaded")
        }
        playerView.player.play()
    }
    
    
   
}
























//MARK: -SetUp Functions


extension VideoPlayerController{
    
    func setPopUpBar(){
        print(prevController)
         self.prevController?.popupBar.customBarViewController = YTpopUp
         self.prevController?.popupBar.gestureRecognizers?[0].addTarget(self, action: #selector(maximize))
         self.prevController?.popupInteractionStyle = .none
         self.prevController?.navigationController?.hideStatusBar()
         self.prevController?.popupContentView.popupCloseButtonStyle = .round
         self.prevController?.popupContentView.popupCloseButton.addTarget(self, action: #selector(minimize(_:)), for: .touchUpInside)
        //maximize and minimize are in the multitasking extension
       }
       
    
       func setControls(){
           playerView.addSubview(versaPlayerControls)
           playerView.use(controls: versaPlayerControls)
           miniPlayerView.use(controls: versaMiniPlayer)
           YTpopUp = YTPopUpBar(player: miniPlayerView)
           versaPlayerControls.pause.isHidden = true
       }
       
       
       func setAutoLayout() {
          playerView.translatesAutoresizingMaskIntoConstraints = false
          playerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
          playerView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
          playerView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
          playerView.heightAnchor.constraint(equalToConstant: view.frame.width * (9/16)).isActive = true
        
           activity.translatesAutoresizingMaskIntoConstraints = false
           activity.centerYAnchor.constraint(equalTo: playerView.centerYAnchor).isActive = true
           activity.centerXAnchor.constraint(equalTo: playerView.centerXAnchor).isActive = true
           activity.widthAnchor.constraint(equalToConstant: 30).isActive = true
           activity.heightAnchor.constraint(equalToConstant: 30).isActive = true
       }
    
}


























//MARK: -MultiTasking

extension VideoPlayerController{

    @objc func maximize() {
        self.miniPlayerView.pause()
        self.prevController?.navigationController?.hideStatusBar()
        self.playerItem?.seek(to: self.miniPlayerItem!.currentTime(), completionHandler: { (done) in
            if done { self.playerView.play()  }else{ self.playerView.pause() }})
        self.status = .Maximized
        print("maximize")
    }
    
     @objc func minimize(_ gestureRecognizer : UITapGestureRecognizer){
         self.playerView.pause()
         self.prevController?.navigationController?.showStatusBar()
         self.miniPlayerItem?.seek(to: self.playerItem!.currentTime(), completionHandler: { (done) in
         if done { self.miniPlayerView.play()  }else{ self.miniPlayerView.pause() }})
         self.status = .Minimized
         print("minimized")
     }
    
}

























//MARK: -PLAYBACK DELEGATE

extension VideoPlayerController :VersaPlayerPlaybackDelegate{
    
    func startBuffering(player: VersaPlayer) {
          activity.startAnimating()
        versaPlayerControls.pause.isHidden = true
          YTpopUp?.activity.startAnimating()
         if player.currentItem! == playerItem{
           //playerItem
         }else if player.currentItem! == miniPlayerItem{
          //MiniplayerItem
         }
     }
    
    
     
     func endBuffering(player: VersaPlayer) {
         if player.currentItem! == playerItem{
            versaPlayerControls.pause.isHidden = false
                  //playerItem
             activity.stopAnimating()
             }else if player.currentItem! == miniPlayerItem{
                 //MiniplayerItem
             YTpopUp?.activity.stopAnimating()
             if status == .Maximized{
                 player.pause()
             }
         }
     }
    
    
}
















enum PlayerStatus {
    case Maximized
    case Minimized
}
