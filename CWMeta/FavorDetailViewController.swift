//
//  FavorDetailViewController.swift
//  CWMeta
//
//  Created by 김대호 on 2015. 7. 7..
//  Copyright (c) 2015년 김대호. All rights reserved.
//

import UIKit
import Social

class FavorDetailViewController : UIViewController {
    var favorArray:NSMutableArray!
    var dataDic = NSDictionary()
    var indexPathRow : Int = 0
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var homePageLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var naviBarImage: UIImageView!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    

    @IBOutlet weak var kakaoBtn: UIButton!
    @IBOutlet weak var faceBookBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    override func viewWillAppear(animated: Bool) {
        
        
        let stringURL =  "http://52.68.142.137"+(dataDic.valueForKey("thumbnail_file") as? String)!
        let imageURL = NSURL(string: stringURL)
        if let dataCashe = NSData(contentsOfURL: imageURL!) {
            thumbnailImage.image = UIImage(data: dataCashe)
        }
        titleLabel.text = dataDic.valueForKey("title") as? String
        nameLabel.text = dataDic.valueForKey("name") as? String
        placeLabel.text = dataDic.valueForKey("place") as? String
        categoryLabel.text = dataDic.valueForKey("category") as? String
        startTimeLabel.text = dataDic.valueForKey("startTime") as? String
        endTimeLabel.text = dataDic.valueForKey("endTime") as? String
        homePageLabel.text = dataDic.valueForKey("email") as? String
        phoneLabel.text = dataDic.valueForKey("tel") as? String
        contentLabel.text = dataDic.valueForKey("content") as? String
        periodLabel.text = dataDic.valueForKey("price") as? String
        priceLabel.text = dataDic.valueForKey("period") as? String
    }
    @IBAction func actPrevious(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func actFaceBook(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
            var fbShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            if fbShare.setInitialText("Some text") {
                NSLog("Success")
            } else {
                NSLog("Failure")
            }
            self.presentViewController(fbShare, animated: true, completion: nil)
        } else {
            var alert = UIAlertController(title: "Accounts", message: "Please login to a Facebook account to share.", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    @IBAction func actCancelFavor(sender: AnyObject) {
        favorArray.removeObjectAtIndex(indexPathRow)
        let path = getFileName("myFavorite.plist")
        favorArray.writeToFile(path, atomically: true)
        var alert = UIAlertView(title: "즐겨찾기", message: "즐겨찾기 메뉴에 제거 되었습니다!", delegate: self, cancelButtonTitle: "확인")
        alert.show()
    }
    func getFileName(fileName:String) -> String {
        let docsDir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let docPath = docsDir[0] as! String
        let fullName = docPath.stringByAppendingPathComponent(fileName)
        return fullName
    }
    @IBAction func actKakao(sender: AnyObject) {
    }

}
