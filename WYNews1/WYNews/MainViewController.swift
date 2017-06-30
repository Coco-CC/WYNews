//
//  MainViewController.swift
//  WYNews
//
//  Created by TYSOFT on 2017/6/29.
//  Copyright © 2017年 TYSOFT. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var titileScrollView: UIScrollView!
    @IBOutlet weak var contentView: UIScrollView!
    
    
  
    var moveLineView : UIView?
    var selButton : TitleButton?
    var titleBtns = [TitleButton]()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        
        setUpChildViewController()
        setUpTitle()
        setUpScrollView()
        
        

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







extension MainViewController{


    func setUpChildViewController()  {
        
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
        
        
        
    }
    
    
    
    func setUpTitle(){
        
        
        let count = self.childViewControllers.count
        
        var btnX : CGFloat? = 0
        let btnY : CGFloat? = 0
        let btnW : CGFloat? = UIScreen.main.bounds.size.width / 4 - 0.5
        let btnH : CGFloat? = 44
        
        
        for num in 0...(count - 1) {
            
         btnX = CGFloat(num) * btnW!
          
            let btn = TitleButton(type: .custom)
            btn.frame = CGRect(x: btnX!, y: btnY!, width: btnW!, height: btnH!)
            btn.tag = num
            btn.setTitleColor(UIColor.black, for: .normal)
            
            let vc = self.childViewControllers[num] as UIViewController
            btn.setTitle(vc.title, for: .normal)
            btn.setTitleColor(UIColor.red, for: .selected)
            btn.backgroundColor = UIColor.white
            
            btn.progress = 0
        
            btn.addTarget(self, action: #selector(titleClick(button:)), for: .touchUpInside)
            self.titileScrollView.addSubview(btn)
            self.titleBtns.append(btn)
            
            
            
            if num == 0 {
                
                titleClick(button: btn)
            }
            
            
            
            
            
        }
        
        
        self.titileScrollView.contentSize = CGSize(width: btnW! * CGFloat(count), height: 0)
        
        
//        titleBottomView = UIView(frame: CGRect(x: 0, y: 44, width:  btnW! * CGFloat(count), height: 2))
//        titileScrollView.addSubview(titleBottomView!)
        
        let moveViewW = UIScreen.main.bounds.size.width / 4
        moveLineView = UIView(frame: CGRect(x: 15, y: 44, width: moveViewW - 30, height: 2))
        moveLineView?.backgroundColor = UIColor.red
        
        self.titileScrollView.addSubview(moveLineView!)
       
        
    }
    
    
    func setUpScrollView()  {
        
        
        titileScrollView.showsHorizontalScrollIndicator = false
    
      contentView.contentSize = CGSize(width: CGFloat(self.childViewControllers.count) * CGFloat(UIScreen.main.bounds.width), height: 0)
        contentView.showsHorizontalScrollIndicator = false
        
        contentView.isPagingEnabled = true
        contentView.bounces = false
        contentView.delegate = self
        
        
        
        
        
    }
    
    
    
    
    func titleClick(button : TitleButton)  {
        
        
     
        
        
        setupTitleBtnMiddle(btn: button)
        
        let offsetX = CGFloat(button.tag) * UIScreen.main.bounds.size.width
        
        self.contentView.contentOffset = CGPoint(x: offsetX, y: 0)
        
        let vc = self.childViewControllers[button.tag]
        vc.view.frame = CGRect(x: offsetX, y: 0, width: UIScreen.main.bounds.size.width
            , height: self.contentView.bounds.size.height)
        
        self.contentView.addSubview(vc.view)
        
        setSelectBtn(btn: button )
        
        
        
//        UIView.beginAnimations(nil, context: nil)
//        UIView.setAnimationDuration(0.3)
//        let moveViewW = UIScreen.main.bounds.size.width / 4
//        self.moveLineView?.frame =  CGRect(x: 15 + moveViewW * CGFloat(button.tag), y: 44, width: moveViewW - 30, height: 2)
//        UIView.commitAnimations()
//        

    
        
        
        
    }
    
    
    
    
    func setupTitleBtnMiddle(btn : UIButton) {
        
        
        var offsetX = btn.center.x - UIScreen.main.bounds.size.width * 0.5
        
        if offsetX < 0 {
            offsetX = 0
        }
        
        let  maxOffsetX = self.titileScrollView.contentSize.width - UIScreen.main.bounds.size.width
        
        if offsetX > maxOffsetX {
            
            offsetX  = maxOffsetX
        }
        
        self.titileScrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
        
        
        
    }
    
    
    
    
    func setSelectBtn(btn : TitleButton) {
        
        selButton?.transform = .identity
        selButton?.setTitleColor(UIColor.black, for: .normal)
        selButton?.isSelected = false
        
        
//        btn.transform =  CGAffineTransform(scaleX: 1.3, y: 1.3)
        btn.transform =  CGAffineTransform(scaleX: 1.0, y: 1.0)
        btn.isSelected = true
        selButton = btn
        
        
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.3)
        let moveViewW = UIScreen.main.bounds.size.width / 4
        self.moveLineView?.frame =  CGRect(x: 15 + moveViewW * CGFloat(btn.tag), y: 44, width: moveViewW - 30, height: 2)
        UIView.commitAnimations()
        
    }






}


extension MainViewController : UIScrollViewDelegate {
    
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let offsetX = scrollView.contentOffset.x
        
        
        let page =  Int(offsetX / scrollView.bounds.size.width)
        
        let btn = self.titileScrollView.subviews[page]
        
        
        setSelectBtn(btn: btn as! TitleButton)
        setupTitleBtnMiddle(btn: btn as! UIButton)
        
        let vc = self.childViewControllers[page]
        
        if vc.isViewLoaded {
            return
        }
        
        vc.view.frame = CGRect(x: offsetX, y: 0, width: self.contentView.bounds.size.width, height: self.contentView.bounds.size.height)
        
        self.contentView.addSubview(vc.view)
        
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let page = scrollView.contentOffset.x / scrollView.bounds.size.width
        
        let leftIndex = Int(page)
        
        let rightScale = page - CGFloat(leftIndex)
        let leftScale = 1.0 - rightScale
        let rightIndex =  leftIndex + 1
        
        let leftBtn = self.titleBtns[leftIndex] 
        let count = self.titleBtns.count
        
        var rightBtn : TitleButton!
        
        if rightIndex < count {
            
            rightBtn = self.titleBtns[rightIndex]
            
//            let rightTransform = rightScale * 0.3 + 1
//            
//            rightBtn.transform = CGAffineTransform(scaleX: rightTransform, y: rightTransform)
            let rightColor = UIColor (red: rightScale, green: 0 , blue: 0 , alpha: 1)
            
            rightBtn.setTitleColor(rightColor, for: .normal)
        }
        
//        let  leftTransform = leftScale * 0.3 + 1
//        leftBtn.transform = CGAffineTransform(scaleX: leftTransform, y: leftTransform)
        let leftColor = UIColor (red: leftScale, green: 0 , blue: 0, alpha: 1)
        

        leftBtn.setTitleColor(leftColor, for: .normal)

        
        
    }


    
    
   


}



