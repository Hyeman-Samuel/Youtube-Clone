//
//  VideoViewCell.swift
//  YoutubeClone
//
//  Created by Samuel Hyeman on 17/06/2020.
//  Copyright © 2020 Samuel Hyeman. All rights reserved.
//

import UIKit

class VideoViewCell: UICollectionViewCell {

    @IBOutlet weak var thumbnaiImage: UIImageView!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoDescLabel: UILabel!
    var Video : Video?
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImage.clipsToBounds = true
        avatarImage.layer.cornerRadius = avatarImage.frame.width / 2
    }
    
    func Setup(video : Video) {
        self.Video = video
        thumbnaiImage.image = #imageLiteral(resourceName: "placeholder")
        setImage(from: video.thumbnailUrl)
        avatarImage.image = #imageLiteral(resourceName: "YT_thumbnail")
        videoTitleLabel.text = video.title
        videoDescLabel.text = video.user + " * "+"2.4M views"+" * " + "3 hours ago";
    }
    
    
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }
            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.thumbnaiImage.image = image
            }
        }
    }
    
    @IBAction func showOptionMenu(_ sender: UIButton) {
        let alert = YBAlertController(style: .ActionSheet)
                   alert.addButton(title: "Save to Watch Later") {
                    print("Saved ",self.Video!.title)
                   }
                   alert.addButton(title: "Save to Playlist") {
                        print("Saved ",self.Video!.title)
                   }
                   alert.addButton(title: "Download") {
                            print("Downloading ",self.Video!.title)
                        }
                    alert.addButton(title: "Share") {
                             print("Shared ",self.Video!.title)
                        }
                    alert.addButton(title: "Not interested") {
                            print("Not interested in ",self.Video!.title)
                                      }
                    alert.addButton(title: "Don't recommend channel") {
                           print("Don't recommend ",self.Video!.title)
                       }
                    alert.addButton(title: "Report") {
                            print("Reported ",self.Video!.title)
                       }
                   alert.cancelButtonTitle = "Cancel"
                   alert.show()
    }
    
}
