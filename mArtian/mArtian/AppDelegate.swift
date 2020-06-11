//
//  AppDelegate.swift
//  mArtian
//
//  Created by Goran Obarcanin on 06/06/2020.
//  Copyright © 2020 MartianAndMAchine. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = AppRootViewController(viewModel: makeRootViewModel())
        return true
    }

}

