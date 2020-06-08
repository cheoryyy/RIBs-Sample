//
//  AppDelegate.swift
//  exampleRIBs
//
//  Created by hclim on 2020/06/03.
//  Copyright © 2020 hclim. All rights reserved.
//

import UIKit
import RIBs
import RxSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - Private

    private var launchRouter: LaunchRouting?
    /// The window.
    public var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        let launchRouter = RootBuilder(dependency: AppComponent()).build()
        self.launchRouter = launchRouter
        launchRouter.launchFromWindow(window)

        return true
    }

}

