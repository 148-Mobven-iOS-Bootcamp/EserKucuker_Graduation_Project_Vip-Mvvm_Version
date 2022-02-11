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
