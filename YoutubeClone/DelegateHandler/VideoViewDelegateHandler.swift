//
//  VideoViewDelegateHandler.swift
//  YoutubeClone
//
//  Created by Samuel Hyeman on 11/06/2020.
//  Copyright © 2020 Samuel Hyeman. All rights reserved.
//

import Foundation
import UIKit

class VideoViewDelegateHandler: NSObject,UICollectionViewDelegateFlowLayout, UICollectionViewDelegate,UICollectionViewDataSource  {
    
    var Navs : [NSLayoutConstraint]?
    var range: Range<CGFloat> = (-100..<0)
    var delegate : VideoPlayerDelegate?
    var Videos = AllVideos().Videos
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        Videos.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "video", for: indexPath) as! VideoViewCell
        let video = Videos[indexPath.item]
           cell.Setup(video: video)
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
      
         let autoLayout = collectionViewLayout as! UICollectionViewFlowLayout
         autoLayout.minimumInteritemSpacing = 0 
                let column : CGFloat = 1
                let collectionWidth = collectionView.bounds.width
                let spacing = autoLayout.minimumInteritemSpacing * (column - 1);
                let adjustedWidth = floor(collectionWidth - spacing)
                let width = adjustedWidth / column
                let height = width * 0.7
//                autoLayout.minimumInteritemSpacing = 20
//                let row : CGFloat = 1
//                let collectionHeight = collectionView.bounds.height
//                let linespacing = autoLayout.minimumInteritemSpacing * (row - 1);
//                let adjustedHeight = floor(collectionHeight - linespacing)
//                let height = adjustedHeight / row
        
        
                return CGSize(width: width , height: height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let video = Videos[indexPath.item]
        delegate?.PlayVideo(video: video)
    }
    
    
      var lastContentOffset = CGFloat()
       func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let delta = scrollView.contentOffset.y - lastContentOffset
        if let NavConstraint = Navs{
            let initial = NavConstraint
            for (index,topConstraint) in NavConstraint.enumerated() {
             if delta < 0 {
                    // the value is negative, so we're scrolling up
                topConstraint.constant = min(topConstraint.constant - delta, range.upperBound)
                 } else if delta > 0  {
                   // the value is positive, so we're scrolling down.
                if max(range.lowerBound, topConstraint.constant - delta) < initial[index].constant{
                    UIView.animate(withDuration: 0.2) {
                        topConstraint.constant = max(self.range.lowerBound, topConstraint.constant - delta)}
                    }                   
                         }
                 }
        }
              lastContentOffset = scrollView.contentOffset.y
        }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
          lastContentOffset = scrollView.contentOffset.y
    }

    
    
}
