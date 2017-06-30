//
//  NewsViewController.swift
//  WYNews
//
//  Created by TYSOFT on 2017/6/29.
//  Copyright © 2017年 TYSOFT. All rights reserved.
//

import UIKit

class NewsViewController: ViewController {

    
    
    var v : UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        print("新闻界面")
        
        v = UIView(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        v.backgroundColor = UIColor.purple
//        self.view.addSubview(v)
        
        
        let Sc = UIScrollView(frame: self.view.bounds)
        
        self.view.addSubview(Sc)
        
        Sc.addSubview(v)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
