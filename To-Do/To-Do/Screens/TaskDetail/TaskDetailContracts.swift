//
//  TaskDetailContracts.swift
//  To-Do
//
//  Created by Eser Kucuker on 11.02.2022.
//

import Foundation

// MARK: VIEWMODEL
protocol TaskDetailViewModelProtocol : AnyObject {
    var delegate : TaskDetailTableViewModelDelegate? { get set }
    func didLoad()
    func addTodo(task:TaskDetailPresentation)
    func goBack()
}


protocol TaskDetailTableViewModelDelegate : AnyObject {
    func handleOutput(_ output : ViewModelOutput)
    func navigate(to route : DetailViewRouter)
}


enum DetailViewRouter {
    case goBack
    case saveAndBack
}
enum ViewModelOutput {
    case showToDoDetail(TaskDetailPresentation)
    case showToDoAdd
    case showAlert
    
}
// MARK: BUILDER SCREEN TYPE

enum builderChoice {
    case DetailView
    case AddView
}
