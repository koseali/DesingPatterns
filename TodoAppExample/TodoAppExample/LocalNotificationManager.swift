//
//  NotificationManager.swift
//  TodoAppExample
//
//  Created by Ali Kose on 11.10.2021.
//

import Foundation
import UserNotifications

class LocalNotificationManager {
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
                print("Islevsiz enumla kaldirabilirim bnu")
            }
        }
    }
    
    private func scheduleNotifications(){
        for notification in notifications {
            
            let content = UNMutableNotificationContent()
            content.title = notification.title
            content.sound = .default
            let trigger = UNCalendarNotificationTrigger(dateMatching: notification.date, repeats: false)
            
            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
            
            UNUserNotificationCenter.current().add(request) { error in
                guard error == nil else{return print("Bildirim olusturulamadi.")}
                print("Bildirim \(notification.id) ID ile basariyla olusturuldu!")
            }
        }
    }
}

struct Notification {
    var id : String
    var title : String
    var date: DateComponents
}
