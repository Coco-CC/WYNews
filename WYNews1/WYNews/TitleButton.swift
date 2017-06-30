//
//  TitleButton.swift
//  WYNews
//
//  Created by TYSOFT on 2017/6/29.
//  Copyright © 2017年 TYSOFT. All rights reserved.
//

import UIKit

class TitleButton: UIButton {
    
    
    var progress : CGFloat? {
    
        
    
         didSet {

               setNeedsDisplay()
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
        
        
     
        
        let draeRect = CGRect(x: 0, y: 0, width: rect.size.width * progress!, height: rect.size.height)
        UIColor.red.set()
        
        UIRectFillUsingBlendMode(draeRect, .sourceIn)

        
        
    }
    
    
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
