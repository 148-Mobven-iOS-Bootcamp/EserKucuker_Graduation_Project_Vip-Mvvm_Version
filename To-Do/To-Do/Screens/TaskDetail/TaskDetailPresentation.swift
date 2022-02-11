//
//  TaskDetailPresentation.swift
//  To-Do
//
//  Created by Eser Kucuker on 11.02.2022.
//

import Foundation


struct TaskDetailPresentation {
    var title: String
    let detail : String
    let endDate : Date?
    
    init(title : String, detail : String, endDate : Date?) {
        self.title = title
        self.detail = detail
        self.endDate = endDate
        
    }
    init(todo : Tasks){
        //TODO: Buraya bak
        self.init(title: todo.title! , detail: todo.detail!, endDate: todo.endDate)
    }
}
