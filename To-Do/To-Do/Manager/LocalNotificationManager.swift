//
//  LocalNotificationManager.swift
//  To-Do
//
//  Created by Eser Kucuker on 11.02.2022.
//

import Foundation
import UserNotifications

class LocalNotificationManager  : NotificationManagerProtocol {
    
    var notifications = [Notification]()
    
    func listScheduledNotifications () {
        UNUserNotificationCenter.current().getPendingNotificationRequests { notifications in
            for notification in notifications{
                print(notification)
            }
        }
    }
    
    
    private func requestAuthorization(){
        UNUserNotificationCenter.current().requestAuthorization(options: [.badge,.sound,.alert]) { permission, error in
            if permission == true && error == nil {
                self.scheduleNotifications()
            }
        }
    }
    
    func schedule(){
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                self.requestAuthorization()
            case .authorized, .provisional:
                self.scheduleNotifications()
            default :
                self.requestAuthorization()
                print("İzin Hatası")
            }
        }
    }
    
    private func scheduleNotifications() {
        
            clearOldNotifications()
        for notification in notifications {
            
            let content = UNMutableNotificationContent()
            content.title = notification.title
            content.sound = .default
            content.body = notification.detail
            let trigger = UNCalendarNotificationTrigger(dateMatching: notification.date, repeats: false)
            
            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                guard error == nil else{return print("Bildirim olusturulamadi.")}
                print("Bildirim \(notification.id) ID ile basariyla olusturuldu!")
            }
        }
    }
    
    private func clearOldNotifications(){
        let currentDate = Date()
        
        for (index,notification) in notifications.enumerated() {
            let dateComponent = notification.date
            guard let notificationDate = Calendar.current.date(from: dateComponent) else {return print("")}
           
            if notificationDate < currentDate {
                notifications.remove(at: index)
            }
        }
    }
    
    func deleteOldNotificationForUpdate(title : String){
        for (index,notification) in notifications.enumerated() {
            if  notification.title == title {
                notifications.remove(at: index)
            }
        }
    }
    
    deinit {
        print("LocalNotificationManager deinit oldu.")
    }
}
