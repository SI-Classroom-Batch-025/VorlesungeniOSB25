//
//  NotificationService.swift
//  VorlesungeniOSB25
//
//  Created by Felix B on 20.05.25.
//

import UserNotifications

class NotificationService {
    
    private let center = UNUserNotificationCenter.current()
    
    func requestPermission() {
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error {
                print(error)
                return
            }
            
            guard granted else {
                print("Berechtigungen nicht gegeben.")
                return
            }
            
            print("Thank you for giving permission.")
        }
    }
    
    func timedNotification() {
        // 1. Content (Was?) wird erstellt
        let content = UNMutableNotificationContent()
        content.title = "Hello World!"
        content.body = "Das ist eine Testnotification!"
        content.sound = UNNotificationSound.default
        
        // 2. Trigger (Wann?) wird erstellt
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        // 3. Schicken
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        center.add(request) { error in
            if let error {
                print("Fehler beim schicken der Notification! \(error)")
            }
        }
    }
    
    func calendarNotification(hour: Int, minute: Int) {
        // 1. Content (Was?) wird erstellt
        let content = UNMutableNotificationContent()
        content.title = "Hello World!"
        content.body = "Das ist eine Testnotification!"
        content.sound = UNNotificationSound.default
        
        // 2. Trigger (Wann?) wird erstellt
        var date = DateComponents()
        date.hour = hour
        date.minute = minute
        let trigger = UNCalendarNotificationTrigger(dateMatching: date, repeats: false)
        // 3. Schicken
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        center.add(request) { error in
            if let error {
                print("Fehler beim schicken der Notification! \(error)")
            }
        }
    }
}
