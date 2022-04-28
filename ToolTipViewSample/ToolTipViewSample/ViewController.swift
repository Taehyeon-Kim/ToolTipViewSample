//
//  ViewController.swift
//  ToolTipViewSample
//
//  Created by taehy.k on 2022/04/27.
//

import UIKit

import EasyTipView

class ViewController: UIViewController, EasyTipViewDelegate {
    func easyTipViewDidTap(_ tipView: EasyTipView) {
        print("did tap")
    }
    
    func easyTipViewDidDismiss(_ tipView: EasyTipView) {
        print("dismiss")
    }
    

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var preferences = EasyTipView.Preferences()
        preferences.drawing.font = UIFont(name: "Futura-Medium", size: 13)!
        preferences.drawing.foregroundColor = UIColor.white
        preferences.drawing.backgroundColor = .black
        preferences.drawing.arrowPosition = EasyTipView.ArrowPosition.bottom

        /*
         * Optionally you can make these preferences global for all future EasyTipViews
         */
        EasyTipView.globalPreferences = preferences

        
        EasyTipView.show(animated: true,
                         forView: self.button,
                         withinSuperview: self.view,
                         text: "내 약을 추가하거나 친구에게 약스케줄을 전송할 수 있어요",
                         preferences: preferences,
                         delegate: self)
    }


}

