//
//  TaskListBuilder.swift
//  To-Do
//
//  Created by Eser Kucuker on 11.02.2022.
//

import Foundation
import UIKit

class TaskListBuilder {
    static func build() -> TaskListViewController {
        let storyboard = UIStoryboard(name: TaskListBuilderString.name.rawValue, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: TaskListBuilderString.name.rawValue) as! TaskListViewController
        let interactor = TaskListInteractor()
        let presenter = TaskListPresenter()
        let router = TaskListRouter()

        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
        return viewController
    }
    
    deinit {
        print("MainView Builder Classı deinit oldu.")
    }
}
