//
//  FilterViewDelegateHandler.swift
//  YoutubeClone
//
//  Created by Samuel Hyeman on 10/06/2020.
//  Copyright © 2020 Samuel Hyeman. All rights reserved.
//

import Foundation
import UIKit

class FilterViewDelegateHandler:NSObject,UICollectionViewDelegateFlowLayout, UICollectionViewDelegate,UICollectionViewDataSource {
   
    var title : String = "Continue watching"
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filter", for: indexPath) as! FilterViewCell
        cell.Setup(title: self.title)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         let autoLayout = collectionViewLayout as! UICollectionViewFlowLayout
        
        
//        let column : CGFloat = 3
//        let collectionWidth = collectionView.bounds.width
//        let spacing = autoLayout.minimumInteritemSpacing * (column - 1);
//        let adjustedWidth = floor(collectionWidth - spacing)
//        let width = adjustedWidth / column
        autoLayout.minimumInteritemSpacing = 10
        let row : CGFloat = 1
        let collectionHeight = collectionView.bounds.height
        let linespacing = autoLayout.minimumInteritemSpacing * (row - 1);
        let adjustedHeight = floor(collectionHeight - linespacing)
        let height = adjustedHeight / row
        
        
        return CGSize(width: 100 , height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected");
    }

}
