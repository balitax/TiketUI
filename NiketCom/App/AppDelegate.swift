//
//  AppDelegate.swift
//  NiketCom
//
//  Created by Agus Cahyono on 04/12/20.
//

import UIKit
import WXNavigationBar

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        WXNavigationBar.setup()
        WXNavigationBar.NavBar.backImage = UIImage(systemName: "arrow.left")
        WXNavigationBar.NavBar.tintColor = .white
        
        let rootViewController = AppRootView()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
        
        return true
    }

}

