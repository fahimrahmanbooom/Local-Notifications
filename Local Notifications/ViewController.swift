//
//  ViewController.swift
//  Local Notifications
//
//  Created by Fahim Rahman on 15/11/19.
//  Copyright © 2019 Fahim Rahman. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        localnotifitacionPermission()
    }
}

func localnotifitacionPermission() {
    
    // Asking for the permission for the notification
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: [.alert, .sound]) {
        (granted, error) in
        
        // Creating the notification content
        let content = UNMutableNotificationContent()
        content.title = "Hey i'm a notification"
        content.body = "Look at me"
        
        // Creating the notification
        let date = Date().addingTimeInterval(10)
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        // Creating the trigger
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
        
        // Creating request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        
        // Register request with notification center
        center.add(request) { (error) in
            // Check the error parameter and handle any errors
        }
    }
}
