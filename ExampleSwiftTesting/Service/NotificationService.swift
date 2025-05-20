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
}
