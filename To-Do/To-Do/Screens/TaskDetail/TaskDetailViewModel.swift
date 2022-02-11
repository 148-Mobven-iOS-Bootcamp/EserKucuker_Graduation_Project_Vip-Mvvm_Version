//
//  TaskDetailViewModel.swift
//  To-Do
//
//  Created by Eser Kucuker on 11.02.2022.
//

import Foundation

class TaskDetailViewModel: TaskDetailViewModelProtocol{
    
    weak var delegate: TaskDetailTableViewModelDelegate?
    
    var todoItem : Tasks
    var screenType : builderChoice!
    var dataManager : DataManagerProtocol
    var notificationManager  : NotificationManagerProtocol
    
    init(todoItem : Tasks, dataManager : DataManagerProtocol, notificationManager  : NotificationManagerProtocol){
        self.todoItem = todoItem
        self.dataManager = dataManager
        self.notificationManager = notificationManager
    }
    
    
    func didLoad() {
        switch screenType {
        case .DetailView:
            delegate?.handleOutput(.showToDoDetail(TaskDetailPresentation.init(todo: todoItem)))
        case .AddView:
            delegate?.handleOutput(.showToDoAdd)
        case .none:
            print("Ekran coker :)")
        }
    }
    
    func addTodo(task:TaskDetailPresentation) {
    
        switch screenType {
            
        case .AddView:
            notificationManager.listScheduledNotifications()
            
            if(task.endDate != nil){
                addNotification(task:task)
            }
            else if (!isValidInput(Input:task.title)){
                delegate?.handleOutput(.showAlert)
                break
            }
            dataManager.saveData(task: task)
            appContainer.ischange = true
            delegate?.navigate(to: .saveAndBack)
            
        case .DetailView:
            if  todoItem.title == task.title  && todoItem.detail == task.detail && todoItem.endDate == task.endDate  {
                delegate?.navigate(to: .goBack)
            } else {
                notificationManager.deleteOldNotificationForUpdate(title: task.title)
                dataManager.updateData(todoItem: todoItem, title: task.title, detail: task.detail, date: task.endDate)
                
                if(task.endDate != nil){
                    addNotification(task:task)
                }
                appContainer.ischange = true
                delegate?.navigate(to: .saveAndBack)
                
            }
            
        case .none:
            print("Beklenmeyen Ekran Gecisi Gerceklesti.")
        }    }
    
    func addNotification(task:TaskDetailPresentation){
        let dateComponent = Calendar.current.dateComponents([.year,.month,.day, .hour, .minute], from: task.endDate!)
        let notification = Notification(id: UUID().uuidString, title: task.title, detail: task.detail, date: dateComponent)
        notificationManager.notifications.append(notification)
        notificationManager.schedule()
        print(notification)
    }
    
    func goBack() {
        delegate?.navigate(to: .goBack)
    }
    
    
    deinit {
        print("DetailViewModel deinit oldu.")
    }
}
