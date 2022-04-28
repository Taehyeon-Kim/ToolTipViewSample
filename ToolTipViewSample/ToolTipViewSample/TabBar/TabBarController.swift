//
//  TabBarController.swift
//  ToolTipViewSample
//
//  Created by taehy.k on 2022/04/28.
//

import UIKit
import EasyTipView

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
    
    let home = ContentViewController()
    let share = ContentViewController()
    let alarm = ContentViewController()
    let add = ContentViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        setupTipView()
    }
    
    private func setupTabBar() {
        tabBar.tintColor = .black
        tabBar.unselectedItemTintColor = .gray
        tabBar.backgroundColor = .white
        
        home.tabBarItem = UITabBarItem(title: "홈", image: TabBarItem.home.Image, selectedImage: TabBarItem.home.selectedImage)
        share.tabBarItem = UITabBarItem(title: "공유", image: TabBarItem.share.Image, selectedImage: TabBarItem.share.selectedImage)
        alarm.tabBarItem = UITabBarItem(title: "알림", image: TabBarItem.alarm.Image, selectedImage: TabBarItem.alarm.selectedImage)
        add.tabBarItem = UITabBarItem(title: "약추가", image: TabBarItem.add.Image, selectedImage: TabBarItem.add.selectedImage)
        
        setViewControllers([home, share, alarm, add], animated: false)
    }
    
    private func setupTipView() {
        var preferences = EasyTipView.Preferences()
        preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
        preferences.drawing.foregroundColor = UIColor.white
        preferences.drawing.backgroundColor = UIColor.black
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.bottom
        
        let tipView = EasyTipView(
            text: "내 약을 추가하거나 친구에게 약스케줄을 전송할 수 있어요",
            preferences: preferences
        )
        
        tipView.show(animated: true, forItem: add.tabBarItem, withinSuperView: self.view)
        
        /// 3초 후에 dismiss
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)) {
            tipView.dismiss()
        }
    }

}
