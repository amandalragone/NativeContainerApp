//
//  MainTabbedView.swift
//  Native Container POC
//
//  Created by Amanda Ragone on 8/6/20.
//  Copyright © 2020 Amanda Ragone. All rights reserved.
//

import UIKit

class MainTabbedView: UITabBarController {
    
    var tabbedView: UITabBar!
            
    var mainTabbedViewModel: MainTabbedViewModelProtocol! {
        didSet {
            mainTabbedViewModel.moduleDidChange = { [unowned self] mainTabbedViewModel in
                self.parent?.navigationItem.title = mainTabbedViewModel.selectedModuleName
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabbedView = UITabBar()
        
        configureTabs()
        
        mainTabbedViewModel = MainTabbedViewModel()

    }
    
    func configureTabs() {
        let firstTab = createController(title: "First Mini App", imageName: "", vc: UIViewController())
        firstTab.view.backgroundColor = .red
        
        let secondTab = createController(title: "Second Mini App", imageName: "", vc: UIViewController())
        secondTab.view.backgroundColor = .blue
        
        let controllers = [firstTab, secondTab]

//        let allApps = miniAppLibrary.allMiniApps()
        
//        var controllers = [UIViewController]()
//        for index in 0...allApps.count-1 {
//            let currentApp = allApps[index]
//            controllers.append(createController(title: currentApp.moduleName, imageName: "placeholder", vc: MiniAppView(index: index)))
//        }
        viewControllers = controllers
        
    }
    
    private func createController(title: String, imageName: String, vc: UIViewController) -> UINavigationController {
        
        let recentVC = UINavigationController(rootViewController: vc)
        recentVC.tabBarItem.title = title
        recentVC.tabBarItem.image = UIImage(named: imageName)
        
        return recentVC
    }
}

extension MainTabbedView: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        mainTabbedViewModel.selectedModuleName = item.title
    }
}

