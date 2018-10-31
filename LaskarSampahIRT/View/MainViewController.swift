//
//  MainViewController.swift
//  LaskarSampahIRT
//
//  Created by Daniel Gunawan on 10/10/18.
//  Copyright © 2018 Daniel Gunawan. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupView()
    }
    
    func setupView() {
        
        let newPath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: view.frame.width, height: tabBar.frame.height + 100), byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 20, height: 20))
        let mask = CAShapeLayer()
        mask.path = newPath.cgPath
        tabBar.layer.mask = mask
    }


}

