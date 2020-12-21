//
//  tabBarController.swift
//  clone-clock-iOS
//
//  Created by inae Lee on 2020/11/25.
//

import UIKit

class tabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
    }
}

extension tabBarController {
    func setTabBar() {
        guard let clockVC = UIStoryboard(name: "Clock", bundle: nil).instantiateViewController(withIdentifier: "ClockNVC") as? UINavigationController,
              let alarmVC = UIStoryboard(name: "Alarm", bundle: nil).instantiateViewController(identifier: "AlarmNVC") as? UINavigationController,
              let stopWatchVC = UIStoryboard(name: "StopWatch", bundle: nil).instantiateViewController(identifier: "StopWatchVC") as? StopWatchVC,
              let TimerVC = UIStoryboard(name: "Timer", bundle: nil).instantiateViewController(identifier: "TimerVC") as? TimerVC else {
            return
        }
        
        clockVC.tabBarItem.image = UIImage(systemName: "globe")
        clockVC.tabBarItem.title = "세계 시계"
        
        alarmVC.tabBarItem.image = UIImage(systemName: "alarm.fill")
        alarmVC.tabBarItem.title = "알람"
        
        stopWatchVC.tabBarItem.image = UIImage(systemName: "stopwatch.fill")
        stopWatchVC.tabBarItem.title = "스톱워치"
        
        TimerVC.tabBarItem.image = UIImage(systemName: "timer")
        TimerVC.tabBarItem.title = "타이머"
        
//        self.tabBar.barStyle = .black
        self.tabBar.barTintColor = .black
        self.tabBar.tintColor = .systemOrange
        
        setViewControllers([clockVC, alarmVC, stopWatchVC, TimerVC], animated: true)
    }
}
