//
//  CustomSegue.swift
//  MyApps
//
//  Created by TORI on 2020/08/27.
//  Copyright © 2020 SJSJ. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    override func perform() {
        // 세그 실행
        let srcUVC = self.source
        let destUVC = self.destination
        UIView.transition(from: srcUVC.view, to: destUVC.view, duration: 2, options: .transitionCurlDown)
    }
}
