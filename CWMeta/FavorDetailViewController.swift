//
//  FavorDetailViewController.swift
//  CWMeta
//
//  Created by 김대호 on 2015. 7. 7..
//  Copyright (c) 2015년 김대호. All rights reserved.
//

import UIKit

class FavorDetailViewController : UIViewController {
    
    var dataDic = NSDictionary()
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var naviBarImage: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        nameLabel.text = dataDic.valueForKey("name") as? String
    }
    @IBAction func actPrevious(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
}
