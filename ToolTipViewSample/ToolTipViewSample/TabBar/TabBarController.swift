//
//  TabBarController.swift
//  ToolTipViewSample
//
//  Created by taehy.k on 2022/04/28.
//

import UIKit

enum TabBarItem {
    case home, share, alarm, add
}

extension TabBarItem {
    var Image: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "ic_home_inactive")
        case .share:
            return UIImage(named: "ic_share_inactive")
        case .alarm:
            return UIImage(named: "ic_alarm_inactive")
        case .add:
            return UIImage(named: "ic_plus_inactive")
        }
    }
    
    var selectedImage: UIImage? {
        switch self {
        case .home:
            return UIImage(named: "ic_home_active")
        case .share:
            return UIImage(named: "ic_share_active")
        case .alarm:
            return UIImage(named: "ic_alarm_active")
        case .add:
            return UIImage(named: "ic_plus_inactive")
        }
    }
}

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray
        tabBar.backgroundColor = .white
        
        let home = ContentViewController()
        let share = ContentViewController()
        let alarm = ContentViewController()
        let add = ContentViewController()
        
        home.tabBarItem = UITabBarItem(title: "홈", image: TabBarItem.home.Image, selectedImage: TabBarItem.home.selectedImage)
        share.tabBarItem = UITabBarItem(title: "공유", image: TabBarItem.share.Image, selectedImage: TabBarItem.share.selectedImage)
        alarm.tabBarItem = UITabBarItem(title: "알림", image: TabBarItem.alarm.Image, selectedImage: TabBarItem.alarm.selectedImage)
        add.tabBarItem = UITabBarItem(title: "약추가", image: TabBarItem.add.Image, selectedImage: TabBarItem.add.selectedImage)
        
        setViewControllers([home, share, alarm, add], animated: false)
    }
}
