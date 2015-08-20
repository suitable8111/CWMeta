//
//  HowToViewController.swift
//  CWMeta
//
//  Created by 김대호 on 2015. 8. 20..
//  Copyright (c) 2015년 김대호. All rights reserved.
//

import UIKit

class HowToViewController : UIViewController {
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var naviBarImg: UIImageView!
    @IBOutlet weak var infoImg: UIImageView!
    override func viewDidLoad() {
        
        let frameForHeight : CGFloat = view.frame.size.height/667
        let frameForWidth : CGFloat = view.frame.size.width/375
        if(frameForHeight != 1){
            backBtn.frame.origin = CGPoint(x: backBtn.frame.origin.x * frameForWidth, y: backBtn.frame.origin.y * frameForHeight)
            naviBarImg.frame.origin = CGPoint(x: naviBarImg.frame.origin.x * frameForWidth, y: naviBarImg.frame.origin.y * frameForHeight)
            infoImg.frame.origin = CGPoint(x: infoImg.frame.origin.x * frameForWidth, y: infoImg.frame.origin.y * frameForHeight)
            
            backBtn.frame.size = CGSizeMake(backBtn.frame.width * frameForWidth,  backBtn.frame.height * frameForHeight)
            naviBarImg.frame.size = CGSizeMake(naviBarImg.frame.width * frameForWidth,  naviBarImg.frame.height * frameForHeight)
            infoImg.frame.size = CGSizeMake(infoImg.frame.width * frameForWidth,  infoImg.frame.height * frameForHeight)
            
        }
    }
    @IBAction func actPrevious(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
}
