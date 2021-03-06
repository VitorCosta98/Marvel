//
//  AppDelegate.swift
//  Marvel
//
//  Created by Vitor Costa on 26/07/20.
//  Copyright © 2020 Vitor Costa. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let controller = HomeViewController(nibName: "HomeView", bundle: nil)
        let worker = HomeWorker()
        let presenter = HomePresenter(view: controller)
        let interactor = HomeInteractor(worker: worker, presenter: presenter)
        controller.interactor = interactor
        
        let nav = UINavigationController(rootViewController: controller)
        nav.navigationBar.topItem?.title = "Marvel"
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        
        return true
    }
}
