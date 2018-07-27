//
//  ViewController.swift
//  2048
//
//  Created by wushang on 2018/7/27.
//  Copyright © 2018年 wushang. All rights reserved.
//

import UIKit

let WSRect = UIScreen.main.bounds
let WSHeight = WSRect.height
let WSWidth = WSRect.width
let WSGamePadding: CGFloat = 15

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "2048";
        setBaseView()
        
    }
    
    func setBaseView() {
        let WSGameZoneSize: CGFloat = WSWidth - 2 * WSGamePadding
        let rect = CGRect(x: WSGamePadding, y: WSHeight - WSGameZoneSize - WSGamePadding, width: WSGameZoneSize, height: WSGameZoneSize)
        let rectView = UIView(frame: rect)
        view.addSubview(rectView)
        rectView.backgroundColor = UIColor.blue
    }

}

