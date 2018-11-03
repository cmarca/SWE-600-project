//
//  AppFlowManager.swift
//  pinspot
//
//  Created by Carlos Marcano on 11/3/18.
//  Copyright © 2018 Carlos Marcano. All rights reserved.
//

import UIKit

class AppFlowController: NSObject {

    static let shared = AppFlowController()

    var appDelegate: AppDelegate?
    var window: UIWindow?
    var tabBarController: UITabBarController?

    func setup(with appDelegate: AppDelegate) {
        self.appDelegate = appDelegate
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.appDelegate?.window = self.window

        let (exploreNavigationController, _) = self.create(viewController: ExploreViewController(), title: "Explore", image: nil)
        let (cameraNavigationController, _) = self.create(viewController: UIViewController(), title: "Camera", image: nil)
        let (profileNavigationController, _) = self.create(viewController: UIViewController(), title: "Profile", image: nil)
        let tabBarController = self.createTabBarController(controllers: [
            exploreNavigationController,
            cameraNavigationController,
            profileNavigationController,
            ])
        self.tabBarController = tabBarController

        self.window?.rootViewController = tabBarController
        self.window?.makeKeyAndVisible()
    }

    // Factories

    private func create(viewController: UIViewController, title: String, image: UIImage?) -> (UINavigationController, UIViewController) {
        viewController.title = title
        let navigationController = UINavigationController.init(rootViewController: viewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        return (navigationController, viewController)
    }


    private func createTabBarController(controllers: [UIViewController]) -> UITabBarController {
        let tabBarController = UITabBarController()
        tabBarController.viewControllers = controllers
        tabBarController.tabBar.isTranslucent = false
        self.tabBarController = tabBarController
        return tabBarController
    }

    // Navigation
}
