//
//  MainChilVC.swift
//  WYNews
//
//  Created by TYSOFT on 2017/6/30.
//  Copyright © 2017年 TYSOFT. All rights reserved.
//

import UIKit

class MainChilVC: MainViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor.purple
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

extension MainChilVC {

    override func setUpChildViewController() {
                let topLineVC = TopLineViewController()
                topLineVC.title = "头条"
                self.addChildViewController(topLineVC)
        
        
                let hotVC = HotViewController()
                hotVC.title = "热点"
                self.addChildViewController(hotVC)
        
        
                let videoVC = VideoViewController()
                videoVC.title = "视频"
                self.addChildViewController(videoVC)
        
        
                let societyVC = SocietyViewController()
                societyVC.title = "社会"
                self.addChildViewController(societyVC)
        
                let readerVC = ReaderViewController()
                readerVC.title = "订阅"
                self.addChildViewController(readerVC)
        
        
                let scienceVC = ScienceViewController()
                scienceVC.title = "科技"
                self.addChildViewController(societyVC)
                
                 contentView.contentSize = CGSize(width: CGFloat(self.childViewControllers.count) * CGFloat(UIScreen.main.bounds.width), height: 0)
    }




}
