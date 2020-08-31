//
//  LibraryViewController.swift
//  YoutubeClone
//
//  Created by Samuel Hyeman on 08/07/2020.
//  Copyright © 2020 Samuel Hyeman. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {

    var navBarHeight = CGFloat()
    let NavBar = CustomNavigationBar().NavBar
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(NavBar)
        setAutoLayout()
        // Do any additional setup after loading the view.
    }
    
    func setAutoLayout(){
           NavBar.translatesAutoresizingMaskIntoConstraints = false
           NavBar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
           NavBar.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
           NavBar.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
           NavBar.heightAnchor.constraint(equalToConstant:navBarHeight).isActive = true
       }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
