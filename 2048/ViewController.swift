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
let WSGameZoneSize: CGFloat = WSWidth - 2 * WSGamePadding
let WSBrickSize = ( WSGameZoneSize - WSBrickPadding * 5 ) / 4
let WSBrickPadding: CGFloat = 8

class ViewController: UIViewController {

    var rectView: UIView?
    var brickArr: Array<UIView>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "2048";
        setBaseView()
        
    }
    
    func setBaseView() {
      
        let rect = CGRect(x: WSGamePadding, y: WSHeight - WSGameZoneSize - WSGamePadding, width: WSGameZoneSize, height: WSGameZoneSize)
        let rectView = UIView(frame: rect)
        view.addSubview(rectView)
        self.rectView = rectView
        self.rectView?.backgroundColor = UIColor.gray
        
        for index in 0...15 {
            createBrick(index: index)
        }
        
    }

    func createBrick(index: NSInteger) {
        let x: CGFloat = CGFloat (index % 4)
        let y: CGFloat = CGFloat (index / 4)
        let rect = CGRect(x: WSBrickPadding * (x + 1) + x * WSBrickSize, y: WSBrickPadding * (y + 1) + y * WSBrickSize, width: WSBrickSize, height: WSBrickSize)
        let brick = UIView(frame: rect)
        
        let label : UILabel = UILabel()
        label.text = String(0)
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textAlignment = NSTextAlignment.center
        label.backgroundColor = UIColor.clear
        label.frame = CGRect(x: WSBrickSize/4, y: WSBrickSize/4, width: WSBrickSize/2, height: WSBrickSize/2)
        
        brick.addSubview(label)
        self.rectView?.addSubview(brick)
        brick.backgroundColor = UIColor.darkGray
        self.brickArr?.append(brick)
    }
}

