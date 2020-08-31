//
//  CustomNavigationBar.swift
//  YoutubeClone
//
//  Created by Samuel Hyeman on 28/06/2020.
//  Copyright © 2020 Samuel Hyeman. All rights reserved.
//

import UIKit


class CustomNavigationBar{
    
    public var NavBar : UIView = {
               let View = UIView()
               View.backgroundColor = .white
               View.layer.borderWidth = 0.5
               View.layer.borderColor = UIColor.gray.cgColor
               ///Logo
                        let Logo = UIImageView(image: UIImage(named:"YTLogo"))
               View.addSubview(Logo)
            
               ///BarButtons
                         let ButtonName=["one","two","three","four"]
                         var Buttons=[UIButton]()
                         ButtonName.forEach { logoName in
                           var button = UIButton(type: .system)
                             //button.setImage(UIImage(named:"Search")?.withRenderingMode(.alwaysTemplate), for: .normal)
                            button.setTitle("A", for: .normal)
                            button.tintColor = .black
                             Buttons.append(button)
                         }
                         var stackView = UIStackView(arrangedSubviews: Buttons)
                         stackView.axis = .horizontal
                         stackView.backgroundColor = .blue
                         stackView.distribution = .fillProportionally
                         stackView.alignment = .fill
            stackView.spacing = 5
               View.addSubview(stackView)
               
               ///All Constraints
                           Logo.translatesAutoresizingMaskIntoConstraints = false
                           Logo.leftAnchor.constraint(equalTo: View.leftAnchor, constant: 20).isActive = true
                           Logo.rightAnchor.constraint(equalTo: View.leftAnchor, constant: 60).isActive = true
                           Logo.centerYAnchor.constraint(equalTo: View.centerYAnchor,constant:10).isActive = true
                           Logo.heightAnchor.constraint(equalToConstant: 30).isActive = true
                     
                            stackView.translatesAutoresizingMaskIntoConstraints = false
                            stackView.rightAnchor.constraint(equalTo: View.rightAnchor,constant: 10).isActive = true
                            stackView.leftAnchor.constraint(equalTo: Logo.rightAnchor,constant:120).isActive = true
                            stackView.centerYAnchor.constraint(equalTo: View.centerYAnchor,constant:10).isActive = true
                            stackView.heightAnchor.constraint(equalToConstant: 20).isActive = true
               return View
           }()
           
    
}
