//
//  WSGameCore.swift
//  2048
//
//  Created by wushang on 2018/7/31.
//  Copyright © 2018年 wushang. All rights reserved.
//

import UIKit

class WSGameCore: NSObject {
    
    static func startGame() {
        addRandomBrick()
        addRandomBrick()
    }
    
    
    static func addRandomBrick () {
        var zeroArr = [WSBrickView]()
        if brickArr.count == 0 {
            return;
        }
        for item in brickArr {
            if(item.num == 0) {
                zeroArr.append(item);
            }
        }
        
        let cnt: Int = zeroArr.count
        let randomIndex = arc4random_uniform(UInt32(cnt))
        brickArr[Int(randomIndex)].num = 2
        
    }
    
    static func canMoveLeft() -> Bool {
        
        let cnt = brickArr.count / 4
        for index in 0..<cnt {
            
            for pos in 1..<4 {
                let st = index * 4 + pos;
                if brickArr[st].num! > 0 {
                    if brickArr[st-1].num == 0 || brickArr[st].num == brickArr[st - 1].num {
                        return true;
                    }
                }
                
            }
        }
        
        return false
    }
    
    
    
    static func moveLeft () {
        if (canMoveLeft()) {
            print("left OK")
        }
    }
}
