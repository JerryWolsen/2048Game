//
//  WS2048GameVC.swift
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
let WSBrickPadding: CGFloat = 8
let WSBrickSize = ( WSGameZoneSize - WSBrickPadding * 5 ) / 4

var brickArr = [WSBrickView]()

class WS2048GameVC: UIViewController {

    var rectView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setBaseView()
        addSwipeGesture()
        
        WSGameCore.startGame()
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
        let brick = WSBrickView(frame: rect)
        self.rectView?.addSubview(brick)
        brick.changeColor(color: UIColor.darkGray)
        brick.num = 0
        brickArr.append(brick)
    }
    
    func addSwipeGesture() {
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeUp(_:)))
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeDown(_:)))
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeLeft(_:)))
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeRight(_:)))
        swipeUp.direction = .up
        swipeDown.direction = .down
        swipeLeft.direction = .left
        swipeRight.direction = .right
        
        view.addGestureRecognizer(swipeUp)
        view.addGestureRecognizer(swipeDown)
        view.addGestureRecognizer(swipeLeft)
        view.addGestureRecognizer(swipeRight)
    }
    
    @objc func swipeUp(_ recognizer: UISwipeGestureRecognizer)  {
        print("up")
        WSGameCore.moveUp()
    }
    
    @objc func swipeDown(_ recognizer: UISwipeGestureRecognizer)  {
        print("down")
        WSGameCore.moveDown()
    }
    
    @objc func swipeLeft(_ recognizer: UISwipeGestureRecognizer)  {
        print("left")
        WSGameCore.moveLeft()
    }
    
    @objc func swipeRight(_ recognizer: UISwipeGestureRecognizer)  {
        print("right")
        WSGameCore.moveRight()
    }
}

