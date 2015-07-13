//
//  InfoViewController.swift
//  CWMeta
//
//  Created by 김대호 on 2015. 7. 9..
//  Copyright (c) 2015년 김대호. All rights reserved.
//

import UIKit

class InfoViewController : UIViewController {
    
    @IBOutlet weak var naviBarImage: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    override func viewDidAppear(animated: Bool) {
        
    }
    @IBAction func actPrevious(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
}
