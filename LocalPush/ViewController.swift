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
    private let identifier = "id"

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(didEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    
    @objc private func didEnterBackground() {
        let content = UNMutableNotificationContent()
        content.badge = 1
        content.body = "你已经很久没有来过了"
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
    
    @objc private func willEnterForeground() {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [identifier])
    }
}
