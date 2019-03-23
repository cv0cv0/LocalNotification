//
//  ViewController.swift
//  LocalPush
//
//  Created by 关蕤 on 2019/3/23.
//  Copyright © 2019 GR. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc private func didEnterBackground() {
        let content = UNMutableNotificationContent()
        content.badge = 1
        content.body = "你已经很久没有来过了"
        content.sound = UNNotificationSound.default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let request = UNNotificationRequest(identifier: "local_push", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    @objc private func willEnterForeground() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        UIApplication.shared.applicationIconBadgeNumber = 0
    }
}
