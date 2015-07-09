//
//  DetailViewController.swift
//  CWMeta
//
//  Created by 김대호 on 2015. 7. 2..
//  Copyright (c) 2015년 김대호. All rights reserved.
//

import UIKit

class DetailViewController : UIViewController {
    
    var dataDic = NSDictionary()
    //즐겨찾기 배열
    var favorArray:NSMutableArray!
    var path:String = ""
    
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
    
    @IBOutlet weak var favorBtn: UIButton!
    @IBOutlet weak var kakaoBtn: UIButton!
    @IBOutlet weak var faceBookBtn: UIButton!
    
    override func viewWillAppear(animated: Bool) {
        
        let path = getFileName("myFavorite.plist")
        let fileManager = NSFileManager.defaultManager()
        
        if(!fileManager.fileExistsAtPath(path)){
            let orgPath = NSBundle.mainBundle().pathForResource("myFavorite", ofType: "plist")
            fileManager.copyItemAtPath(orgPath!, toPath: path, error: nil)
        }
        favorArray = NSMutableArray(contentsOfFile: path)
        
        let stringURL =  "http://52.68.142.137"+(dataDic.valueForKey("thumbnail_file") as? String)!
        let imageURL = NSURL(string: stringURL)
        if let dataCashe = NSData(contentsOfURL: imageURL!) {
            thumbnailImage.image = UIImage(data: dataCashe)
        }
    }
    
    
    @IBAction func actFavorBtn(sender: AnyObject) {
        path = getFileName("myFavorite.plist")
        favorArray.addObject(dataDic)
        favorArray.writeToFile(path, atomically: true)
    }
    func getFileName(fileName:String) -> String {
        let docsDir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let docPath = docsDir[0] as! String
        let fullName = docPath.stringByAppendingPathComponent(fileName)
        return fullName
    }
    @IBAction func acrPrevious(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func actKakaoLink(sender: AnyObject) {
//        let label = KakaoTalkLinkObject.createLabel("Test Label")
//        
//        
//        let image = KakaoTalkLinkObject.createImage("https://developers.kakao.com/assets/img/link_sample.jpg", width: 138, height: 80)
//        
//        
//        let webLink = KakaoTalkLinkObject.createWebLink("Test Link", url: "http://www.kakao.com")
//        
//        
//        let androidAppAction = KakaoTalkLinkAction.createAppAction(KakaoTalkLinkActionOSPlatform.Android, devicetype: KakaoTalkLinkActionDeviceType.Phone, execparam: nil)
//        
//        
//        let iphoneAppAction = KakaoTalkLinkAction.createAppAction(KakaoTalkLinkActionOSPlatform.IOS, devicetype: KakaoTalkLinkActionDeviceType.Phone, execparam: ["test1" : "test1", "test2" : "test2"])
//        
//        
//        let ipadAppAction = KakaoTalkLinkAction.createAppAction(KakaoTalkLinkActionOSPlatform.IOS, devicetype: KakaoTalkLinkActionDeviceType.Pad, execparam: ["test1" : "test1", "test2" : "test2"])
//        
//        
//        let appLink = KakaoTalkLinkObject.createAppButton("Test Button", actions: [androidAppAction, iphoneAppAction, ipadAppAction])
//        
//        
//        if KOAppCall.canOpenKakaoTalkAppLink() {
//            KOAppCall.openKakaoTalkAppLink([label, image, webLink, appLink])
//        } else {
//            println("cannot open kakaotalk.")
//        }
    }
    @IBAction func actFaceBook(sender: AnyObject) {
    }

}
