//
//  AppDelegate.swift
//  Metrics
//
//  Created by Agrim Srivastava on 28/01/23.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print(NSHomeDirectory())
        let value = UserDefaults.standard.integer(forKey: "firstTime")
        if value == 0 {
            print("Running first time")
            UserDefaults.standard.setValue(1, forKey:   "firstTime")
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "OnBoardingViewController")
            window?.rootViewController = vc
        } else {
            print("Running after first time")
            
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let viewController = sb.instantiateViewController(withIdentifier: "tabBarController")
            window?.rootViewController = viewController
            
        }
        FirebaseApp.configure()
        File.copyResourcesToDocumentsIfNeeded()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }


}

