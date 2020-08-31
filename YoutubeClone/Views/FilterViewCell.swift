//
//  FilterViewCell.swift
//  YoutubeClone
//
//  Created by Samuel Hyeman on 16/06/2020.
//  Copyright © 2020 Samuel Hyeman. All rights reserved.
//

import UIKit

class FilterViewCell: UICollectionViewCell {

    @IBOutlet weak var filterButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        filterButton.layer.borderColor = UIColor.lightGray.cgColor
        filterButton.layer.backgroundColor = UIColor.clear.cgColor
        filterButton.layer.borderWidth = 0.1
        filterButton.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .light)
        filterButton.setTitleColor(.blue, for: .normal)
        filterButton.layer.cornerRadius = filterButton.frame.height / 2
        filterButton.setTitleColor(.black, for: .normal)
    }
    

    func Setup(title : String )  {
          filterButton.setTitle(title, for: .normal)
       }

}
