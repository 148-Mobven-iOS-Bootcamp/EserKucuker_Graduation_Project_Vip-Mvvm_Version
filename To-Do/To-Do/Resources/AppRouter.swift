//
//  AppRouter.swift
//  To-Do
//
//  Created by Eser Kucuker on 11.02.2022.
//

import Foundation
import UIKit

class AppRouter {
    func start(scene: UIWindowScene) -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        let taskListVC = TaskListBuilder.build()
        let navigationContoller = UINavigationController(rootViewController: taskListVC)
        
        navigationContoller.navigationBar.isHidden = true
        window.rootViewController = navigationContoller
        window.makeKeyAndVisible()
        window.windowScene = scene
        
        return window
    }
}
