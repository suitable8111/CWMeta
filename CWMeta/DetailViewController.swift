//
//  DetailViewController.swift
//  CWMeta
//
//  Created by 김대호 on 2015. 7. 2..
//  Copyright (c) 2015년 김대호. All rights reserved.
//

import UIKit
import MapKit
import Social

class DetailViewController : UIViewController, UIScrollViewDelegate {
    
    var dataDic = NSDictionary()
    var favorArray:NSMutableArray!
    var path:String = ""
    var isImage = false
    var isFavor = false
    
    @IBOutlet weak var uiScrollView: UIScrollView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var contentLabel: UITextView!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var explainLabel: UILabel!
    @IBOutlet weak var mapViewLabel: UILabel!
    
    @IBOutlet weak var phoneBtn: UIButton!
    @IBOutlet weak var kakaoLinkBtn: UIButton!
    @IBOutlet weak var kakaoStoryBtn: UIButton!
    @IBOutlet weak var shareBackBtn: UIButton!
    @IBOutlet weak var shareBtn: UIButton!
    @IBOutlet weak var favorBtn: UIButton!
    @IBOutlet weak var twitterBtn: UIButton!
    @IBOutlet weak var faceBookBtn: UIButton!
    @IBOutlet weak var backBtn: UIButton!
   
    @IBOutlet weak var selectImage: UIImageView!
    @IBOutlet weak var naviBarImage: UIImageView!
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var btnsBg: UIImageView!
    @IBOutlet weak var labelsBg: UIImageView!
    
    @IBOutlet weak var shareView: UIView!
    @IBOutlet weak var hiddenView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var uiSegment: UISegmentedControl!
    
    @IBOutlet weak var sPlaceLabel: UILabel!
    @IBOutlet weak var sTimeLabel: UILabel!
    @IBOutlet weak var sNameLabel: UILabel!
    @IBOutlet weak var sContentLabel: UILabel!
    @IBOutlet weak var sPeriodLabel: UILabel!
    @IBOutlet weak var sShareLabel: UILabel!
    @IBOutlet weak var sCallLabel: UILabel!
    @IBOutlet weak var sFavorLabel: UILabel!
    @IBOutlet weak var sKaKaoLinkLabel: UILabel!
    @IBOutlet weak var sTwitterLabel: UILabel!
    @IBOutlet weak var sFaceBookLabel: UILabel!
    @IBOutlet weak var sKakaoStoryLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        
        let path = getFileName("myFavorite.plist")
        let fileManager = NSFileManager.defaultManager()
        var isEqual = false
        
        if(!fileManager.fileExistsAtPath(path)){
            let orgPath = NSBundle.mainBundle().pathForResource("myFavorite", ofType: "plist")
            fileManager.copyItemAtPath(orgPath!, toPath: path, error: nil)
        }
        favorArray = NSMutableArray(contentsOfFile: path)
        
        uiScrollView.delegate = self
        self.automaticallyAdjustsScrollViewInsets = false
        uiScrollView.contentSize =  CGSizeMake(view.frame.width*2, view.frame.height)
        uiScrollView.frame.size = CGSizeMake(view.frame.width,view.frame.height)
        let frameForHeight : CGFloat = view.frame.size.height/667
        let frameForWidth : CGFloat = view.frame.size.width/375
        if(frameForHeight != 1){
            titleLabel.frame.origin = CGPoint(x: titleLabel.frame.origin.x * frameForWidth, y: titleLabel.frame.origin.y * frameForHeight)
            nameLabel.frame.origin = CGPoint(x: nameLabel.frame.origin.x * frameForWidth, y: nameLabel.frame.origin.y * frameForHeight)
            placeLabel.frame.origin = CGPoint(x: placeLabel.frame.origin.x * frameForWidth, y: backBtn.frame.origin.y * frameForHeight)
            placeLabel.frame.origin = CGPoint(x: placeLabel.frame.origin.x * frameForWidth, y: titleLabel.frame.origin.y * frameForHeight)
            startTimeLabel.frame.origin = CGPoint(x: startTimeLabel.frame.origin.x * frameForWidth, y: startTimeLabel.frame.origin.y * frameForHeight)
            endTimeLabel.frame.origin = CGPoint(x: endTimeLabel.frame.origin.x * frameForWidth, y: endTimeLabel.frame.origin.y * frameForHeight)
            contentLabel.frame.origin = CGPoint(x: contentLabel.frame.origin.x * frameForWidth, y: contentLabel.frame.origin.y * frameForHeight)
            periodLabel.frame.origin = CGPoint(x: periodLabel.frame.origin.x * frameForWidth, y: periodLabel.frame.origin.y * frameForHeight)
            explainLabel.frame.origin = CGPoint(x: explainLabel.frame.origin.x * frameForWidth, y: explainLabel.frame.origin.y * frameForHeight)
            mapViewLabel.frame.origin = CGPoint(x: mapViewLabel.frame.origin.x * frameForWidth, y: mapViewLabel.frame.origin.y * frameForHeight)
            phoneBtn.frame.origin = CGPoint(x: phoneBtn.frame.origin.x * frameForWidth, y: phoneBtn.frame.origin.y * frameForHeight)
            kakaoLinkBtn.frame.origin = CGPoint(x: kakaoLinkBtn.frame.origin.x * frameForWidth, y: kakaoLinkBtn.frame.origin.y * frameForHeight)
            kakaoStoryBtn.frame.origin = CGPoint(x: kakaoStoryBtn.frame.origin.x * frameForWidth, y: kakaoStoryBtn.frame.origin.y * frameForHeight)
            shareBackBtn.frame.origin = CGPoint(x: shareBackBtn.frame.origin.x * frameForWidth, y: shareBackBtn.frame.origin.y * frameForHeight)
            shareBtn.frame.origin = CGPoint(x: shareBtn.frame.origin.x * frameForWidth, y: shareBtn.frame.origin.y * frameForHeight)
            favorBtn.frame.origin = CGPoint(x: favorBtn.frame.origin.x * frameForWidth, y: favorBtn.frame.origin.y * frameForHeight)
            twitterBtn.frame.origin = CGPoint(x: twitterBtn.frame.origin.x * frameForWidth, y: twitterBtn.frame.origin.y * frameForHeight)
            faceBookBtn.frame.origin = CGPoint(x: faceBookBtn.frame.origin.x * frameForWidth, y: faceBookBtn.frame.origin.y * frameForHeight)
            backBtn.frame.origin = CGPoint(x: backBtn.frame.origin.x * frameForWidth, y: backBtn.frame.origin.y * frameForHeight)
            selectImage.frame.origin = CGPoint(x: selectImage.frame.origin.x * frameForWidth, y: selectImage.frame.origin.y * frameForHeight)
            naviBarImage.frame.origin = CGPoint(x: naviBarImage.frame.origin.x * frameForWidth, y: naviBarImage.frame.origin.y * frameForHeight)
            thumbnailImage.frame.origin = CGPoint(x: thumbnailImage.frame.origin.x * frameForWidth, y: thumbnailImage.frame.origin.y * frameForHeight)
            btnsBg.frame.origin = CGPoint(x: btnsBg.frame.origin.x * frameForWidth, y: btnsBg.frame.origin.y * frameForHeight)
            labelsBg.frame.origin = CGPoint(x: labelsBg.frame.origin.x * frameForWidth, y: labelsBg.frame.origin.y * frameForHeight)
            shareView.frame.origin = CGPoint(x: shareView.frame.origin.x * frameForWidth, y: shareView.frame.origin.y * frameForHeight)
            hiddenView.frame.origin = CGPoint(x: hiddenView.frame.origin.x * frameForWidth, y: hiddenView.frame.origin.y * frameForHeight)
            mapView.frame.origin = CGPoint(x: mapView.frame.origin.x * frameForWidth, y: mapView.frame.origin.y * frameForHeight)
            uiSegment.frame.origin = CGPoint(x: uiSegment.frame.origin.x * frameForWidth, y: uiSegment.frame.origin.y * frameForHeight)
            sPlaceLabel.frame.origin = CGPoint(x: sPlaceLabel.frame.origin.x * frameForWidth, y: sPlaceLabel.frame.origin.y * frameForHeight)
            sTimeLabel.frame.origin = CGPoint(x: sTimeLabel.frame.origin.x * frameForWidth, y: sTimeLabel.frame.origin.y * frameForHeight)
            sNameLabel.frame.origin = CGPoint(x: sNameLabel.frame.origin.x * frameForWidth, y: sNameLabel.frame.origin.y * frameForHeight)
            sContentLabel.frame.origin = CGPoint(x: sContentLabel.frame.origin.x * frameForWidth, y: sContentLabel.frame.origin.y * frameForHeight)
            sPeriodLabel.frame.origin = CGPoint(x: sPeriodLabel.frame.origin.x * frameForWidth, y: sPeriodLabel.frame.origin.y * frameForHeight)
            sShareLabel.frame.origin = CGPoint(x: sShareLabel.frame.origin.x * frameForWidth, y: sShareLabel.frame.origin.y * frameForHeight)
            sCallLabel.frame.origin = CGPoint(x: sCallLabel.frame.origin.x * frameForWidth, y: sCallLabel.frame.origin.y * frameForHeight)
            sFavorLabel.frame.origin = CGPoint(x: sFavorLabel.frame.origin.x * frameForWidth, y: sFavorLabel.frame.origin.y * frameForHeight)
            sKaKaoLinkLabel.frame.origin = CGPoint(x: sKaKaoLinkLabel.frame.origin.x * frameForWidth, y: sKaKaoLinkLabel.frame.origin.y * frameForHeight)
            sTwitterLabel.frame.origin = CGPoint(x: sTwitterLabel.frame.origin.x * frameForWidth, y: sKaKaoLinkLabel.frame.origin.y * frameForHeight)
            sFaceBookLabel.frame.origin = CGPoint(x: sFaceBookLabel.frame.origin.x * frameForWidth, y: sFaceBookLabel.frame.origin.y * frameForHeight)
            sKakaoStoryLabel.frame.origin = CGPoint(x: sKakaoStoryLabel.frame.origin.x * frameForWidth, y: sKakaoStoryLabel.frame.origin.y * frameForHeight)
         
            titleLabel.frame.size = CGSizeMake( titleLabel.frame.width * frameForWidth,  titleLabel.frame.height * frameForHeight)
            nameLabel.frame.size = CGSizeMake( nameLabel.frame.width * frameForWidth,  nameLabel.frame.height * frameForHeight)
            placeLabel.frame.size = CGSizeMake( placeLabel.frame.width * frameForWidth,  backBtn.frame.height * frameForHeight)
            placeLabel.frame.size = CGSizeMake( placeLabel.frame.width * frameForWidth,  titleLabel.frame.height * frameForHeight)
            startTimeLabel.frame.size = CGSizeMake( startTimeLabel.frame.width * frameForWidth,  startTimeLabel.frame.height * frameForHeight)
            endTimeLabel.frame.size = CGSizeMake( endTimeLabel.frame.width * frameForWidth,  endTimeLabel.frame.height * frameForHeight)
            contentLabel.frame.size = CGSizeMake( contentLabel.frame.width * frameForWidth,  contentLabel.frame.height * frameForHeight)
            periodLabel.frame.size = CGSizeMake( periodLabel.frame.width * frameForWidth,  periodLabel.frame.height * frameForHeight)
            explainLabel.frame.size = CGSizeMake( explainLabel.frame.width * frameForWidth,  explainLabel.frame.height * frameForHeight)
            mapViewLabel.frame.size = CGSizeMake( mapViewLabel.frame.width * frameForWidth,  mapViewLabel.frame.height * frameForHeight)
            phoneBtn.frame.size = CGSizeMake( phoneBtn.frame.width * frameForWidth,  phoneBtn.frame.height * frameForHeight)
            kakaoLinkBtn.frame.size = CGSizeMake( kakaoLinkBtn.frame.width * frameForWidth,  kakaoLinkBtn.frame.height * frameForHeight)
            kakaoStoryBtn.frame.size = CGSizeMake( kakaoStoryBtn.frame.width * frameForWidth,  kakaoStoryBtn.frame.height * frameForHeight)
            shareBackBtn.frame.size = CGSizeMake( shareBackBtn.frame.width * frameForWidth,  shareBackBtn.frame.height * frameForHeight)
            shareBtn.frame.size = CGSizeMake( shareBtn.frame.width * frameForWidth,  shareBtn.frame.height * frameForHeight)
            favorBtn.frame.size = CGSizeMake( favorBtn.frame.width * frameForWidth,  favorBtn.frame.height * frameForHeight)
            twitterBtn.frame.size = CGSizeMake( twitterBtn.frame.width * frameForWidth,  twitterBtn.frame.height * frameForHeight)
            faceBookBtn.frame.size = CGSizeMake( faceBookBtn.frame.width * frameForWidth,  faceBookBtn.frame.height * frameForHeight)
            backBtn.frame.size = CGSizeMake( backBtn.frame.width * frameForWidth,  backBtn.frame.height * frameForHeight)
            selectImage.frame.size = CGSizeMake( selectImage.frame.width * frameForWidth,  selectImage.frame.height * frameForHeight)
            naviBarImage.frame.size = CGSizeMake( naviBarImage.frame.width * frameForWidth,  naviBarImage.frame.height * frameForHeight)
            thumbnailImage.frame.size = CGSizeMake( thumbnailImage.frame.width * frameForWidth,  thumbnailImage.frame.height * frameForHeight)
            btnsBg.frame.size = CGSizeMake( btnsBg.frame.width * frameForWidth,  btnsBg.frame.height * frameForHeight)
            labelsBg.frame.size = CGSizeMake( labelsBg.frame.width * frameForWidth,  labelsBg.frame.height * frameForHeight)
            shareView.frame.size = CGSizeMake( shareView.frame.width * frameForWidth,  shareView.frame.height * frameForHeight)
            hiddenView.frame.size = CGSizeMake( hiddenView.frame.width * frameForWidth,  hiddenView.frame.height * frameForHeight)
            mapView.frame.size = CGSizeMake( mapView.frame.width * frameForWidth,  mapView.frame.height * frameForHeight)
            uiSegment.frame.size = CGSizeMake( uiSegment.frame.width * frameForWidth,  uiSegment.frame.height * frameForHeight)
            sPlaceLabel.frame.size = CGSizeMake( sPlaceLabel.frame.width * frameForWidth,  sPlaceLabel.frame.height * frameForHeight)
            sTimeLabel.frame.size = CGSizeMake( sTimeLabel.frame.width * frameForWidth,  sTimeLabel.frame.height * frameForHeight)
            sNameLabel.frame.size = CGSizeMake( sNameLabel.frame.width * frameForWidth,  sNameLabel.frame.height * frameForHeight)
            sContentLabel.frame.size = CGSizeMake( sContentLabel.frame.width * frameForWidth,  sContentLabel.frame.height * frameForHeight)
            sPeriodLabel.frame.size = CGSizeMake( sPeriodLabel.frame.width * frameForWidth,  sPeriodLabel.frame.height * frameForHeight)
            sShareLabel.frame.size = CGSizeMake( sShareLabel.frame.width * frameForWidth,  sShareLabel.frame.height * frameForHeight)
            sCallLabel.frame.size = CGSizeMake( sCallLabel.frame.width * frameForWidth,  sCallLabel.frame.height * frameForHeight)
            sFavorLabel.frame.size = CGSizeMake( sFavorLabel.frame.width * frameForWidth,  sFavorLabel.frame.height * frameForHeight)
            sKaKaoLinkLabel.frame.size = CGSizeMake( sKaKaoLinkLabel.frame.width * frameForWidth,  sKaKaoLinkLabel.frame.height * frameForHeight)
            sTwitterLabel.frame.size = CGSizeMake( sTwitterLabel.frame.width * frameForWidth,  sKaKaoLinkLabel.frame.height * frameForHeight)
            sFaceBookLabel.frame.size = CGSizeMake( sFaceBookLabel.frame.width * frameForWidth,  sFaceBookLabel.frame.height * frameForHeight)
            sKakaoStoryLabel.frame.size = CGSizeMake( sKakaoStoryLabel.frame.width * frameForWidth,  sKakaoStoryLabel.frame.height * frameForHeight)
        }
        
        
        
        let stringURL =  "http://52.68.142.137"+(dataDic.valueForKey("thumbnail_file") as? String)!
        let imageURL = NSURL(string: stringURL)
        if let dataCashe = NSData(contentsOfURL: imageURL!) {
            thumbnailImage.image = UIImage(data: dataCashe)
            isImage = true
        }
        
        titleLabel.text = dataDic.valueForKey("title") as? String
        nameLabel.text = dataDic.valueForKey("name") as? String
        placeLabel.text = dataDic.valueForKey("place") as? String
        startTimeLabel.text = dataDic.valueForKey("startTime") as? String
        endTimeLabel.text = dataDic.valueForKey("endTime") as? String
        contentLabel.text = dataDic.valueForKey("content") as? String
        periodLabel.text = dataDic.valueForKey("price") as? String
        
        shareView.layer.cornerRadius = 5
        shareView.layer.masksToBounds = true
        mapView.layer.cornerRadius = 5
        mapView.layer.masksToBounds = true
        labelsBg.layer.cornerRadius = 5
        labelsBg.layer.masksToBounds = true
        btnsBg.layer.cornerRadius = 5
        btnsBg.layer.masksToBounds = true
        
        for var num:Int = 0; num < favorArray.count; num = num + 1 {
            if (favorArray.objectAtIndex(num).valueForKey("title") as! String == dataDic.valueForKey("title") as! String){
                isFavor = true
            }
        }
        if isFavor {
            favorBtn.setImage(UIImage(named: "favor_heart_add.png"), forState: UIControlState.Normal)
        }
        makeMapView()
    }
    
    func getFileName(fileName:String) -> String {
        let docsDir = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
        let docPath = docsDir[0] as! String
        let fullName = docPath.stringByAppendingPathComponent(fileName)
        return fullName
    }
    func makeMapView() {
        let x = dataDic.valueForKey("latitude") as? String
        let y = dataDic.valueForKey("longtitude") as? String
        if(x != ""){
            
            var location = CLLocationCoordinate2D()
            
            var xNSString = NSString(string: x!)
            var xToDouble = xNSString.doubleValue
            
            var yNSString = NSString(string: y!)
            var yToDouble = yNSString.doubleValue
            
            location.latitude = xToDouble
            location.longitude = yToDouble
            
            let span = MKCoordinateSpanMake(0.01, 0.01)
            let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
            
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = dataDic.valueForKey("place") as? String
            mapView.addAnnotation(annotation)
        }
    }
    @IBAction func acrPrevious(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    @IBAction func actFavorBtn(sender: AnyObject) {
        
        for var num:Int = 0; num < favorArray.count; num = num + 1 {
            if (favorArray.objectAtIndex(num).valueForKey("title") as! String == dataDic.valueForKey("title") as! String){
                isFavor = true
            }
        }
        
        if(favorArray.count == 0){
            path = getFileName("myFavorite.plist")
            favorArray.addObject(dataDic)
            favorArray.writeToFile(path, atomically: true)
            var alert = UIAlertView(title: "즐겨찾기", message: "즐겨찾기 메뉴에 추가 되었습니다!", delegate: self, cancelButtonTitle: "확인")
            alert.show()
            favorBtn.setImage(UIImage(named: "favor_heart_add.png"), forState: UIControlState.Normal)
        }else {
            if isFavor {
                favorArray.removeObjectAtIndex(favorArray.count-1)
                let path = getFileName("myFavorite.plist")
                favorArray.writeToFile(path, atomically: true)
                var alert = UIAlertView(title: "즐겨찾기", message: "즐겨찾기 제거 되었습니다.", delegate: self, cancelButtonTitle: "확인")
                alert.show()
                favorBtn.setImage(UIImage(named: "Detail_FavorBtn.png"), forState: UIControlState.Normal)
                isFavor = false
            }else {
                path = getFileName("myFavorite.plist")
                favorArray.addObject(dataDic)
                favorArray.writeToFile(path, atomically: true)
                var alert = UIAlertView(title: "즐겨찾기", message: "즐겨찾기 메뉴에 추가 되었습니다!", delegate: self, cancelButtonTitle: "확인")
                alert.show()
                favorBtn.setImage(UIImage(named: "favor_heart_add.png"), forState: UIControlState.Normal)
            }
        }
        
    }
    @IBAction func actPhoneCall(sender: AnyObject) {
        var alert = UIAlertView(title: "전화걸기", message: "전화 걸어 예약하시겠습니까?", delegate: self, cancelButtonTitle: "취소")
        alert.addButtonWithTitle("전화걸기")
        alert.show()
    }
    @IBAction func actMapStyle(sender: AnyObject) {
        switch (uiSegment.selectedSegmentIndex){
        case 0 :
            mapView.mapType = MKMapType.Standard
            break
        case 1 :
            mapView.mapType = MKMapType.Satellite
            break
        case 2 :
            mapView.mapType = MKMapType.Hybrid
            break
        default :
            
            break
        }
    }
    @IBAction func actShare(sender: AnyObject) {
        UIView.animateWithDuration(0.7, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: nil, animations: {
            self.hiddenView.alpha = CGFloat(0.5)
            self.shareView.transform = CGAffineTransformMakeTranslation(0,-150*self.view.frame.height/667)

            }, completion: nil)
    }
    @IBAction func actShareBack(sender: AnyObject) {
        UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: nil, animations: {
            self.shareView.transform = CGAffineTransformMakeTranslation(0,0)
            self.hiddenView.alpha = CGFloat(0)
            }, completion: nil)
    }
    @IBAction func actKakaoStory(sender: AnyObject) {
        KOSessionTask.storyIsStoryUserTaskWithCompletionHandler({(isUser : Bool, userError : NSError!) in
            if userError != nil{
                println("Suesses user login")
                if self.dataDic.valueForKey("thumbnail_file") as? String != ""{
                    let stringURL =  "http://52.68.142.137"+(self.dataDic.valueForKey("thumbnail_file") as? String)!
                    let imageURL = NSURL(string: stringURL)
                    let dataCashe = NSData(contentsOfURL: imageURL!)
                    let thumImage = UIImage(data: dataCashe!)
                    let imageAry = NSMutableArray()
                    imageAry.removeAllObjects()
                    imageAry.addObject(thumImage!)
                    KOSessionTask.storyMultiImagesUploadTaskWithImages(imageAry as [AnyObject]!, completionHandler: {(imageUrl : [AnyObject]!, imageError : NSError!) in
                                            if imageError != nil {
                                                println("Suesses image")
                                                let initText = "[문화 알림 소식]!! \n 제목 : " + self.titleLabel.text! + "\n 장소" + self.placeLabel.text! + "\n 시간 :" + self.startTimeLabel.text! + "~" + self.endTimeLabel.text!
                                                KOSessionTask.storyPostPhotoTaskWithImageUrls(imageUrl, content: initText,
                                                            permission: KOStoryPostPermission.Friend,
                                                            sharable: true, androidExecParam: ["andParm1":"value1","andParam2":"value2"],
                                                            iosExecParam: ["andParm1":"value1","andParam2":"value2"],
                                                            completionHandler: {(post: KOStoryPostInfo! ,postError:NSError!) in if (postError != nil){
                                                            println("Suesses image to post")
                                                }else{
                                                            println("Fail image to post")
                                                }
                                                })
                                            }else {
                                                println("Fail image")
                                            }
                        })
                }else{
                    let initText = "[문화 알림 소식]!! \n 제목 : " + self.titleLabel.text! + "\n 장소" + self.placeLabel.text! + "\n 시간 :" + self.startTimeLabel.text! + "~" + self.endTimeLabel.text!
                    KOSessionTask.storyPostNoteTaskWithContent(initText,
                                permission: KOStoryPostPermission.Friend,
                                sharable: true,
                                androidExecParam: ["andParm1":"value1","andParam2":"value2"],
                                iosExecParam: ["andParm1":"value1","andParam2":"value2"],
                                completionHandler: {(post: KOStoryPostInfo! ,
                                                    postError:NSError!) in if (postError != nil){
                                                        println("Suesses to post")
                                                    }else{
                                                        println("Fail to post")
                                                    }
                                })
                }
            }else{
                println("fail user login")
            }
        })
        
        
       
    }
    
    @IBAction func actTwitter(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter){
            var twShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            let initText = "[문화 알림 소식]!! \n 제목 : " + titleLabel.text! + "\n 장소" + placeLabel.text! + "\n 시간 :" + startTimeLabel.text! + "~" + endTimeLabel.text!
            twShare.setInitialText(initText)
            if isImage{
                twShare.addImage(thumbnailImage.image)
            }
            self.presentViewController(twShare, animated: true, completion: nil)
        } else {
            var alert = UIAlertController(title: "로그인 오류", message: "트위터에 로그인 후 사용해주세요", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    @IBAction func actKakaoLink(sender: AnyObject) {
            let initText = "[문화 알림 소식]!! \n 제목 : " + titleLabel.text! + "\n 장소" + placeLabel.text! + "\n 시간 :" + startTimeLabel.text! + "~" + endTimeLabel.text!
        
            let mainLabel = KakaoTalkLinkObject.createLabel(initText)
        //  let androidAppAction = KakaoTalkLinkAction.createAppAction(KakaoTalkLinkActionOSPlatform.Android, devicetype: KakaoTalkLinkActionDeviceType.Phone, execparam: nil)
        //  let iphoneAppAction = KakaoTalkLinkAction.createAppAction(KakaoTalkLinkActionOSPlatform.IOS, devicetype: KakaoTalkLinkActionDeviceType.Phone, execparam: nil)
        //  let ipadAppAction = KakaoTalkLinkAction.createAppAction(KakaoTalkLinkActionOSPlatform.IOS, devicetype: KakaoTalkLinkActionDeviceType.Pad, execparam: nil)
        //  let appLink = KakaoTalkLinkObject.createWebButton("앱으로 가기", url: "http://www.naver.com")
        
            if KOAppCall.canOpenKakaoTalkAppLink() {
                    KOAppCall.openKakaoTalkAppLink([mainLabel])
            } else {
                println("cannot open kakaotalk.")
            }

    }
    @IBAction func actFaceBook(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook){
            var fbShare:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            let initText = "[문화 알림 소식]!! \n 제목 : " + titleLabel.text! + "\n 장소" + placeLabel.text! + "\n 시간 :" + startTimeLabel.text! + "~" + endTimeLabel.text!
            fbShare.setInitialText(initText)
            if isImage{
                fbShare.addImage(thumbnailImage.image)
            }
            self.presentViewController(fbShare, animated: true, completion: nil)
        } else {
            var alert = UIAlertController(title: "로그인 오류", message: "페이스북에 로그인 후 사용해주세요", preferredStyle: UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }

    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        let indexNum = buttonIndex
        if(indexNum == 1){
            let urlStirng : String = "tel://" + (dataDic.valueForKey("tel") as! String)
            let url = NSURL(string: urlStirng)
            UIApplication.sharedApplication().openURL(url!)
        }
    }
    func scrollViewWillBeginDecelerating(scrollView: UIScrollView) {
        scrollView.userInteractionEnabled = false
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        var indexPage = scrollView.contentOffset.x / scrollView.frame.width
        if(indexPage == 0){
            UIView.animateWithDuration(0.5, delay: 0.00, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: nil, animations: {
                self.selectImage.transform = CGAffineTransformMakeTranslation(0, 0)
                }, completion: nil)
        }else{
            UIView.animateWithDuration(0.5, delay: 0.00, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: nil, animations: {
                self.selectImage.transform = CGAffineTransformMakeTranslation(self.view.center.x*indexPage, 0)
                }, completion: nil)
        }
        
        scrollView.userInteractionEnabled = true
    }
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        var indexPage = scrollView.contentOffset.x / scrollView.frame.width
        var frame = scrollView.frame;
        frame.origin.x = frame.size.width * indexPage;
        frame.origin.y  = 0;
        scrollView.scrollRectToVisible(frame, animated: true)
    }
}
