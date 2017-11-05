//
//  AppDelegate.swift
//  KoolicarTest
//
//  Created by Joe Peplowski on 2017-11-05.
//  Copyright © 2017 Joseph Peplowski. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let initialViewController = window?.rootViewController as! UINavigationController
        let vehicleTableViewController = initialViewController.viewControllers.first as! VehicleTableViewController
        vehicleTableViewController.vehicleController = VehicleController()
        return true
    }

}

