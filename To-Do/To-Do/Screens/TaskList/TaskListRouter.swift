//
//  TaskListRouter.swift
//  To-Do
//
//  Created by Eser Kucuker on 11.02.2022.
//

import Foundation

class TaskListRouter: TaskListRouterProtocol {
    weak var viewController: TaskListViewController?
    var dataStore: TaskListDataStoreProtocol?
    
    func navigate(to route: TaskListRoute) {
        switch route {
        case .showTodoDetail(let index):
            if let tasks = dataStore?.tasks {
                let task = tasks[index]
                
                let destinationVC = TaskDetailBuilder.build(with: task, screenType: .DetailView)
                self.viewController?.navigationController?.show(destinationVC, sender: true)
                
            }
        case .showAddView:
            let destinationVC = TaskDetailBuilder.build(with: Tasks(), screenType: .AddView)
            self.viewController?.navigationController?.show(destinationVC, sender: true)
        }
    }
}
