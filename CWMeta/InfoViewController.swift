//
//  InfoViewController.swift
//  CWMeta
//
//  Created by 김대호 on 2015. 7. 9..
//  Copyright (c) 2015년 김대호. All rights reserved.
//

import UIKit

class InfoViewController : UIViewController {
    


    @IBOutlet weak var goHomePageBtn: UIButton!
    @IBOutlet weak var goHowToBtn: UIButton!
    @IBOutlet weak var infoImg: UIImageView!
    @IBOutlet weak var naviBarImage: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let frameForHeight : CGFloat = view.frame.size.height/667
        let frameForWidth : CGFloat = view.frame.size.width/375
        if(frameForHeight != 1){
            backBtn.frame.origin = CGPoint(x: backBtn.frame.origin.x * frameForWidth, y: backBtn.frame.origin.y * frameForHeight)
            goHomePageBtn.frame.origin = CGPoint(x: goHomePageBtn.frame.origin.x * frameForWidth, y: goHomePageBtn.frame.origin.y * frameForHeight)
            goHowToBtn.frame.origin = CGPoint(x: goHowToBtn.frame.origin.x * frameForWidth, y: goHowToBtn.frame.origin.y * frameForHeight)
            infoImg.frame.origin = CGPoint(x: infoImg.frame.origin.x * frameForWidth, y: infoImg.frame.origin.y * frameForHeight)
            naviBarImage.frame.origin = CGPoint(x: naviBarImage.frame.origin.x * frameForWidth, y: naviBarImage.frame.origin.y * frameForHeight)
            
            backBtn.frame.size = CGSizeMake(backBtn.frame.width * frameForWidth,  backBtn.frame.height * frameForHeight)
            goHomePageBtn.frame.size = CGSizeMake(goHomePageBtn.frame.width * frameForWidth,  goHomePageBtn.frame.height * frameForHeight)
            goHowToBtn.frame.size = CGSizeMake(goHowToBtn.frame.width * frameForWidth,  goHowToBtn.frame.height * frameForHeight)
            infoImg.frame.size = CGSizeMake(infoImg.frame.width * frameForWidth,  infoImg.frame.height * frameForHeight)
            naviBarImage.frame.size = CGSizeMake(naviBarImage.frame.width * frameForWidth,  naviBarImage.frame.height * frameForHeight)
        
        }
    }
    @IBAction func actPrevious(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
}
