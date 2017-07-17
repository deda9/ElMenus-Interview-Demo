//
//  AppDelegate.swift
//  ElmenusDemo
//
//  Created by Bassem Qoulta on 7/17/17.
//  Copyright © 2017 Bassem Qoulta. All rights reserved.
//

import UIKit
import Dotzu

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        openHomeView()
        setupDotzuDebugger()
        return true
    }

    private func openHomeView(){
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        
        let restuarantsViewController = RestuarantsViewController(nibName: "RestuarantsView", bundle: nil)
        let navigationController: UINavigationController = UINavigationController.init(rootViewController: restuarantsViewController)
        
        self.window?.tintColor = UIColor.white
        self.window!.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
    
    
    private func setupDotzuDebugger(){
        #if DEBUG
            Dotzu.sharedManager.enable();
        #endif
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

