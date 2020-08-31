//
//  CollectionViews.swift
//  YoutubeClone
//
//  Created by Samuel Hyeman on 28/06/2020.
//  Copyright © 2020 Samuel Hyeman. All rights reserved.
//

import Foundation
import UIKit

class CollectionViews {
    
        private var videoDelegateHandler = VideoViewDelegateHandler()
        private let videoVerticalayout : UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            func createVideoCollection()-> UICollectionView {
              let View = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())
                View.register(UINib(nibName: "VideoViewCell", bundle: nil), forCellWithReuseIdentifier: "video")
                View.backgroundColor = .clear
               // View.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
                View.layer.borderWidth = 0.4
                View.layer.backgroundColor = UIColor.white.cgColor
                View.bounces = false
                View.showsVerticalScrollIndicator = false
                videoVerticalayout.scrollDirection = .vertical
                videoVerticalayout.sectionHeadersPinToVisibleBounds = true
                View.collectionViewLayout = videoVerticalayout
                View.delegate = videoDelegateHandler
                View.dataSource = videoDelegateHandler
               return View
           }
    
    
        private var filterDelegateHandler = FilterViewDelegateHandler()
        private let filterHorizontalayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
         func createFilterCollection()-> UICollectionView {
          let View = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewFlowLayout())
          View.register(UINib(nibName: "FilterViewCell", bundle: nil), forCellWithReuseIdentifier: "filter")
          View.backgroundColor = .clear
            //View.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10);
            View.layer.borderColor = UIColor.gray.cgColor
            View.layer.borderWidth = 0.4
            View.layer.backgroundColor = UIColor.white.cgColor
            View.collectionViewLayout = filterHorizontalayout
            filterHorizontalayout.scrollDirection = .horizontal
            filterHorizontalayout.sectionHeadersPinToVisibleBounds = true
            View.showsHorizontalScrollIndicator = false
            View.bounces = false
            View.delegate = filterDelegateHandler
            View.dataSource = filterDelegateHandler
            return View
        }
    
    
    private var storyDelegateHandler = StoriesViewDelegateHandler()
    private let storyHorizontalayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
    private var storiesCollection : UICollectionView?
        func createStoriesCollection()-> UICollectionView {
         let View = UICollectionView(frame:CGRect(), collectionViewLayout: UICollectionViewFlowLayout())
         //View.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: "story")
         View.register(UINib(nibName: "StoryViewCell", bundle: nil), forCellWithReuseIdentifier: "story")
         View.backgroundColor = .white
        // View.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10);
         View.layer.borderColor = UIColor.gray.cgColor
         View.layer.borderWidth = 0
         View.collectionViewLayout = storyHorizontalayout
         storyHorizontalayout.scrollDirection = .horizontal
         storyHorizontalayout.sectionHeadersPinToVisibleBounds = true
         View.delegate = storyDelegateHandler
         View.dataSource = storyDelegateHandler
         return View
     }
     
     
      
    
}
