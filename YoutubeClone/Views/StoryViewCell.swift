//
//  StoryViewCell.swift
//  YoutubeClone
//
//  Created by Samuel Hyeman on 28/06/2020.
//  Copyright © 2020 Samuel Hyeman. All rights reserved.
//

import UIKit

class StoryViewCell: UICollectionViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var availableIndicator: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImage.layer.cornerRadius = avatarImage.frame.height / 2
        availableIndicator.layer.cornerRadius = availableIndicator.frame.height / 2
        availableIndicator.backgroundColor = .blue
    }
    
    func Setup(title : String,isAvailable : Bool) {
        titleLabel.text = title
        if !isAvailable{
            availableIndicator.isHidden = true
        }
    }
    

}
