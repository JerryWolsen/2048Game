//
//  WSBrickView.swift
//  2048
//
//  Created by wushang on 2018/7/27.
//  Copyright © 2018年 wushang. All rights reserved.
//

import UIKit

class WSBrickView: UIView {

    let label = UILabel(frame: CGRect.zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        label.frame = CGRect(x: frame.width/4, y: frame.height/4, width: frame.width/2, height: frame.height/2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        createLabel()
    
    }
    
    func createLabel() {
        
        label.textColor = UIColor.white
        label.font = UIFont.boldSystemFont(ofSize: 32)
        label.textAlignment = NSTextAlignment.center
        label.backgroundColor = UIColor.clear
        self.addSubview(label)
        
    }
    
    func changeNum (num: NSInteger) {
        label.text = String(num)
    }
    
    func changeColor(color: UIColor) {
        self.backgroundColor = color
    }
}
