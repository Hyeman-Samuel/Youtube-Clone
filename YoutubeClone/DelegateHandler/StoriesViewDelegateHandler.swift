//
//  StoriesViewDelegateHandler.swift
//  YoutubeClone
//
//  Created by Samuel Hyeman on 10/06/2020.
//  Copyright © 2020 Samuel Hyeman. All rights reserved.
//

import Foundation
import UIKit

class StoriesViewDelegateHandler:NSObject,UICollectionViewDelegateFlowLayout, UICollectionViewDelegate,UICollectionViewDataSource {

func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    12
}


func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "story", for: indexPath) as! StoryViewCell
    cell.Setup(title: "Title", isAvailable: true)
     return cell
}


func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let autoLayout = collectionViewLayout as! UICollectionViewFlowLayout
    
    let row : CGFloat = 1
    let collectionHeight = collectionView.bounds.height
    autoLayout.minimumLineSpacing = 0
    let linespacing = autoLayout.minimumLineSpacing * (row - 1) ;
    let adjustedHeight = floor(collectionHeight - linespacing)
    let height = adjustedHeight / row
    let width = height
    return CGSize(width: width  , height: height)
}
    
}
