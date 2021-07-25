//
//  AppDelegate.swift
//  wikimovie
//
//  Created by Salim Wijaya on 21/07/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let vc: ViewController = ViewController()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window  = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = AppContainer.shared.movieViewController
        self.window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }


}

