//
//  AppContainer.swift
//  To-Do
//
//  Created by Eser Kucuker on 11.02.2022.
//

import Foundation

var appContainer = AppContainer()

class AppContainer {
    var router = AppRouter()
    var dataManager = CoreDataManager()
    var notificationManager = LocalNotificationManager()
    var ischange = false
}
