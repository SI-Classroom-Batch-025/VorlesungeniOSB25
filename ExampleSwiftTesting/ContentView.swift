//
//  ContentView.swift
//  ExampleSwiftTesting
//
//  Created by Felix B on 19.05.25.
//

import SwiftUI

struct ContentView: View {
    
    private let notifications = NotificationService()
    @State private var date = Date()
    
    var getTimeFromDate: [String] {
        date.formatted(date: .omitted, time: .shortened).components(separatedBy: ":")
    }
    
    var body: some View {
        VStack {
            
            Text(getTimeFromDate.description)
            
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            DatePicker("Select Notification Time", selection: $date, displayedComponents: .hourAndMinute)
            
            Button("Notifications!") {
                notifications.requestPermission()
            }
            
            Button("Send Timed Notification!") {
                notifications.timedNotification()
            }
            
            Button("Send Calendar Notification!") {
                notifications.calendarNotification(hour: Int(getTimeFromDate[0]) ?? 0, minute: Int(getTimeFromDate[1]) ?? 0)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
