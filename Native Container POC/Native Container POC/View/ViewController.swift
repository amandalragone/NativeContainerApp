//
//  ViewController.swift
//  Native Container POC
//
//  Created by Amanda Ragone on 8/6/20.
//  Copyright © 2020 Amanda Ragone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tabbedView: UITabBarController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displayTabbar()

    }
    
    func displayTabbar(){
        tabbedView = MainTabbedView()

        view.addSubview(tabbedView.view)
        addChild(tabbedView)
        tabbedView.didMove(toParent: self)
        
        tabbedView.view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tabbedView.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabbedView.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabbedView.view.topAnchor.constraint(equalTo: view.topAnchor),
            tabbedView.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

    }

}

