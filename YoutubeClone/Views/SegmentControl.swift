//
//  SegmentControl.swift
//  YoutubeClone
//
//  Created by Samuel Hyeman on 08/06/2020.
//  Copyright © 2020 Samuel Hyeman. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class SegmentControl: UIView{
    

    var delegate : SegmentControlDelegate?

    var buttons = [UIButton]();
    
    @IBInspectable
    var commaSeperatedButtonTitle : String = "" {
        didSet{
            UpdateUI()
        }
    }
    
    @IBInspectable
    var border_Color : UIColor = .gray {
        didSet{
            layer.borderColor = border_Color.cgColor
        }
    }
    @IBInspectable
    var background_color: UIColor = .white{
        didSet{
            backgroundColor = background_color
        }
    }
    
    func UpdateUI() {
        let TabButtons = commaSeperatedButtonTitle.components(separatedBy: ",")
        TabButtons.forEach { (title) in
            let newButton = UIButton(type: .custom)
            let imageSize:CGSize = CGSize(width: 100, height: 100)
            if let image = UIImage(named: title){

                newButton.setImage(image.withRenderingMode(.alwaysTemplate), for: .normal)
                 newButton.setTitle(title, for: .normal)
                newButton.setTitleColor(.systemGray, for: .normal)
                newButton.titleLabel?.font = .boldSystemFont(ofSize: 8)
                newButton.backgroundColor = .clear
                newButton.tintColor = .systemGray
                newButton.layer.cornerRadius = 20
                newButton.imageEdgeInsets = UIEdgeInsets(
                      top: (imageSize.height) / 2 - 20 ,
                      left: (imageSize.width) / 2 - 5,
                      bottom: ((imageSize.height) / 2) - 10 ,
                      right: ((imageSize.width) / 2) )
                newButton.titleEdgeInsets = UIEdgeInsets(
                    top: 33,
                    left: 30,
                    bottom: 3,
                    right: 15)
                
               
            }

            newButton.addTarget(self, action: #selector(buttonClicked(selectedButton:)), for: .touchUpInside)
            buttons.append(newButton);
        }
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        self.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false;
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
    }
    
    
    @objc func buttonClicked(selectedButton : UIButton){
                       // selectedButton.isSelected = false
        
        buttons.forEach { (button) in
            if button == selectedButton{
                
                button.tintColor = .systemRed
                button.setTitleColor(.systemRed, for: .normal)
                delegate?.segmentPicked(title: button.currentTitle!)
                UIView.animate(withDuration: 0.1, animations: {
                    button.backgroundColor = .lightGray
                }, completion: { (isDone) in
                    if isDone{ button.backgroundColor = .clear}
                })
                
            }else{
                button.tintColor = .systemGray
                button.setTitleColor(.systemGray, for: .normal)
            }
        }
    }
    
    
    
    override func draw(_ rect: CGRect) {
    }
    

}
