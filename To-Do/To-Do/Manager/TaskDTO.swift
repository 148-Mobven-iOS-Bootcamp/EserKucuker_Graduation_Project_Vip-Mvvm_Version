//
//  TaskDTO.swift
//  To-Do
//
//  Created by Eser Kucuker on 11.02.2022.
//

import Foundation

struct TaskDTO {
    let title : String
    let detail : String
    let endDate: Date?
    
    init(title : String, detail : String, endDate : Date?){
        self.title = title
        self.detail = detail
        self.endDate = endDate
    }
    
    // TODO: Add Guard let
    init(todo : Tasks){
        self.init(title: todo.title!, detail: todo.detail!, endDate: todo.endDate)
    }
}


struct Task {
    let title : String
    let detail : String
    let endDate: Date?
}
