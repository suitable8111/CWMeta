//
//  IntroViewController.swift
//  CWMeta
//
//  Created by 김대호 on 2015. 7. 15..
//  Copyright (c) 2015년 김대호. All rights reserved.
//

import UIKit

class IntroViewController : UIViewController {
    
    @IBOutlet weak var introImage: UIImageView!
    
    override func viewDidLoad() {
        let frameForHeight : CGFloat = view.frame.size.height/667
        let frameForWidth : CGFloat = view.frame.size.width/375
        introImage.frame.size = CGSizeMake(introImage.frame.width * frameForWidth,  introImage.frame.height * frameForHeight)
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.0,
                                                            target: self,
                                                            selector: Selector("pushView"),
                                                            userInfo: nil,
                                                            repeats: false)
    }
    func pushView(){
        self.navigationController?.pushViewController(
            self.storyboard?.instantiateViewControllerWithIdentifier("ViewController") as! ViewController,
            animated: true)
    }
}
