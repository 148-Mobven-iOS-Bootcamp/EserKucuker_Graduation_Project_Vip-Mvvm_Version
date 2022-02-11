//
//  Constants.swift
//  To-Do
//
//  Created by Eser Kucuker on 11.02.2022.
//

import Foundation

struct Notification {
    var id : String
    var title : String
    var detail : String
    var date: DateComponents
}

enum TaskListBuilderString : String{
    case name = "TaskList"
}

enum TaskIdentifierString : String{
    case identifier = "identifier"
}

enum TaskDetailViewController: String{
    case addTaskButtonText = "Update"
    case alertMessage = "Lütfen Başlık Giriniz"
}

enum TaskListVC  : String {
    case identifier = "identifier"
    case titleForDeleteConfirmationButtonForRowAt = "Delete"
}

enum CoreData: String{
    case name = "To_Do"
    case entityName = "Tasks"
    case key = "createdDate"
    case title = "title"
    case detail = "detail"
    case deadlineDate = "endDate"
}
