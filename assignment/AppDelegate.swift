//
//  AppDelegate.swift
//  assignment
//
//  Created by Neil Houston on 22/10/2018.
//  Copyright © 2018 Neil Houston. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var appClosure = Languages()
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {

    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        appClosure.load()
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        appClosure.load()
    }

    func applicationWillTerminate(_ application: UIApplication) {
       appClosure.save()
    }


}

