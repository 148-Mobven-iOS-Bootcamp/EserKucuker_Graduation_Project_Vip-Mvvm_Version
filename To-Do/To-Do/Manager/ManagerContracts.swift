//
//  ManagerContracts.swift
//  To-Do
//
//  Created by Eser Kucuker on 11.02.2022.
//

import Foundation

protocol DataManagerProtocol {
    func updateData(todoItem : Tasks, title : String, detail : String, date : Date?)
    func saveData()
    func fetchData() -> [Tasks]
    func deleteData(todoItem : Tasks)
    func sortbyCreatedData() -> [Tasks]
    func searchData(with : String) -> [Tasks]
}

protocol NotificationManagerProtocol {
    var notifications : [Notification] { get set }
    func listScheduledNotifications ()
    func schedule()
    func  deleteOldNotificationForUpdate(title : String)
}
