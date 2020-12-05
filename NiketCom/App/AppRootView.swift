//
//  AppRootView.swift
//  NiketCom
//
//  Created by Agus Cahyono on 05/12/20.
//

import UIKit

class AppRootView: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        createTabBar()
    }
    
    fileprivate func createTabBar() {
        let home = UINavigationController(rootViewController: HomeView())
        home.tabBarItem = UITabBarItem(title: "Home", image: #imageLiteral(resourceName: "ichomeunselect"), selectedImage: #imageLiteral(resourceName: "ichome"))
        
        let orders = UINavigationController(rootViewController: UIViewController())
        orders.tabBarItem = UITabBarItem(title: "My Order", image: #imageLiteral(resourceName: "icorderunselected"), selectedImage: #imageLiteral(resourceName: "icorder"))
        
        let rewards = UINavigationController(rootViewController: UIViewController())
        rewards.tabBarItem = UITabBarItem(title: "Elite Rewards", image: #imageLiteral(resourceName: "icrewards"), selectedImage: #imageLiteral(resourceName: "icrewardsselected"))
        
        let profile = UINavigationController(rootViewController: UIViewController())
        profile.tabBarItem = UITabBarItem(title: "Akun", image: #imageLiteral(resourceName: "icakun"), selectedImage: #imageLiteral(resourceName: "icakunselected"))
        
        self.viewControllers = [
            home,
            orders,
            rewards,
            profile
        ]
        
        self.tabBar.backgroundColor = .white
        self.tabBar.isTranslucent = false
        self.tabBar.tintColor = Constant.AppTheme.mainBlue
        
    }
    
}
