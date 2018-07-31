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
}
