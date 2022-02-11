//
//  TaskDetailBuilder.swift
//  To-Do
//
//  Created by Eser Kucuker on 11.02.2022.
//

import Foundation
import UIKit

class TaskDetailBuilder {
    static func build(with todo : Tasks, screenType : builderChoice) -> TaskDetailTableViewController{
        let storyboard = UIStoryboard(name: "TaskDetail", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "TaskDetail") as! TaskDetailTableViewController
    }
}
