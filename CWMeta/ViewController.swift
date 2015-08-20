//
//  ViewController.swift
//  CWMeta
//
//  Created by 김대호 on 2015. 6. 29..
//  Copyright (c) 2015년 김대호. All rights reserved.
//

import UIKit


class ViewController: UIViewController , UIScrollViewDelegate{

    var dataModel : DataModel!
    var cagoDataArray : NSMutableArray!
    var transforming = true
    var rotating = true
    var moveHeight :CGFloat = 190
    
    @IBOutlet weak var aniImageView4: UIImageView!
    @IBOutlet weak var aniImageView3: UIImageView!
    @IBOutlet weak var aniImageView2: UIImageView!
    @IBOutlet weak var aniImageView: UIImageView!
    @IBOutlet weak var mainBg: UIImageView!
    @IBOutlet weak var infoBg: UIImageView!
    
    @IBOutlet weak var exhibitBtn: UIButton!
    @IBOutlet weak var eventBtn: UIButton!
    @IBOutlet weak var marketBtn: UIButton!
    @IBOutlet weak var favorBtn: UIButton!
    @IBOutlet weak var infoBtn: UIButton!
    @IBOutlet weak var allBtn: UIButton!
    @IBOutlet weak var menuBtn: UIButton!
    
    @IBOutlet weak var infoScrollView: UIScrollView!

 //   @IBOutlet weak var showScrollView: UIScrollView!
    
    func modelData() -> DataModel{
        if(dataModel == nil){
            dataModel = DataModel()
        }
        return dataModel
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = true
        
        infoScrollView.contentSize = CGSizeMake(view.frame.size.width, 1500)
        infoScrollView.delegate = self
        let frameForHeight : CGFloat = view.frame.size.height/667
        let frameForWidth : CGFloat = view.frame.size.width/375
        moveHeight = moveHeight*frameForHeight
        if(frameForHeight != 1){
            exhibitBtn.frame.origin = CGPoint(x: exhibitBtn.frame.origin.x * frameForWidth, y: exhibitBtn.frame.origin.y * frameForHeight)
            eventBtn.frame.origin = CGPoint(x: eventBtn.frame.origin.x * frameForWidth, y: eventBtn.frame.origin.y * frameForHeight)
            marketBtn.frame.origin = CGPoint(x: marketBtn.frame.origin.x * frameForWidth, y: marketBtn.frame.origin.y * frameForHeight)
            favorBtn.frame.origin = CGPoint(x: favorBtn.frame.origin.x * frameForWidth, y: favorBtn.frame.origin.y * frameForHeight)
            infoBtn.frame.origin = CGPoint(x: infoBtn.frame.origin.x * frameForWidth, y: infoBtn.frame.origin.y * frameForHeight)
            allBtn.frame.origin = CGPoint(x: allBtn.frame.origin.x * frameForWidth, y: allBtn.frame.origin.y * frameForHeight)
            menuBtn.frame.origin = CGPoint(x: menuBtn.frame.origin.x * frameForWidth, y: menuBtn.frame.origin.y * frameForHeight)
            mainBg.frame.origin = CGPoint(x: mainBg.frame.origin.x * frameForWidth, y: mainBg.frame.origin.y * frameForHeight)
            infoBg.frame.origin = CGPoint(x: infoBg.frame.origin.x * frameForWidth, y: infoBg.frame.origin.y * frameForHeight)
            infoScrollView.frame.origin = CGPoint(x: infoScrollView.frame.origin.x * frameForWidth, y: infoScrollView.frame.origin.y * frameForHeight)
            
            exhibitBtn.frame.size = CGSizeMake(exhibitBtn.frame.width * frameForWidth,  exhibitBtn.frame.height * frameForHeight)
            eventBtn.frame.size = CGSizeMake(eventBtn.frame.width * frameForWidth,  eventBtn.frame.height * frameForHeight)
            marketBtn.frame.size = CGSizeMake(marketBtn.frame.width * frameForWidth,  marketBtn.frame.height * frameForHeight)
            favorBtn.frame.size = CGSizeMake(favorBtn.frame.width * frameForWidth,  favorBtn.frame.height * frameForHeight)
            infoBtn.frame.size = CGSizeMake(infoBtn.frame.width * frameForWidth,  infoBtn.frame.height * frameForHeight)
            menuBtn.frame.size = CGSizeMake(menuBtn.frame.width * frameForWidth,  menuBtn.frame.height * frameForHeight)
            allBtn.frame.size = CGSizeMake(allBtn.frame.width * frameForWidth,  allBtn.frame.height * frameForHeight)
            mainBg.frame.size = CGSizeMake(mainBg.frame.width * frameForWidth,  mainBg.frame.height * frameForHeight)
            infoScrollView.frame.size = CGSizeMake(infoScrollView.frame.width * frameForWidth,  infoScrollView.frame.height * frameForHeight)
            
            UIView.animateWithDuration(1.3, delay: 0.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: nil, animations: {
                self.favorBtn.transform = CGAffineTransformMakeTranslation(0,-120 * frameForHeight)
                self.marketBtn.transform = CGAffineTransformMakeTranslation(110 * frameForWidth,-55 * frameForHeight)
                self.eventBtn.transform = CGAffineTransformMakeTranslation(110 * frameForWidth,+55 * frameForHeight)
                self.exhibitBtn.transform = CGAffineTransformMakeTranslation(0,120 * frameForHeight)
                self.allBtn.transform = CGAffineTransformMakeTranslation(-110 * frameForWidth,55 * frameForHeight)
                self.infoBtn.transform = CGAffineTransformMakeTranslation(-110 * frameForWidth,-55 * frameForHeight)
                }, completion: nil)
        }else {
            UIView.animateWithDuration(1.3, delay: 0.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: nil, animations: {
                self.favorBtn.transform = CGAffineTransformMakeTranslation(0,-120)
                self.marketBtn.transform = CGAffineTransformMakeTranslation(110,-55)
                self.eventBtn.transform = CGAffineTransformMakeTranslation(110,+55)
                self.exhibitBtn.transform = CGAffineTransformMakeTranslation(0,120)
                self.allBtn.transform = CGAffineTransformMakeTranslation(-110,55)
                self.infoBtn.transform = CGAffineTransformMakeTranslation(-110,-55)
            }, completion: nil)
        }
        rotateOnce()
        self.modelData()
        dataModel.beginParsing()
        cagoDataArray = NSMutableArray()
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        cagoDataArray = []
        if(segue.identifier == "goMarket"){
            var tvControl = segue.destinationViewController as! TableViewController
        
            for (var indexNum = 0; indexNum < dataModel.posts.count; indexNum++) {
                if(dataModel.posts.objectAtIndex(indexNum).valueForKey("category")!.isEqualToString("마켓&행사")){
                    cagoDataArray.addObject(dataModel.posts.objectAtIndex(indexNum))
                }
            }
            tvControl.cagoAry = cagoDataArray as NSArray
            tvControl.currentState = segue.identifier!
        }else if(segue.identifier == "goEvent"){
            var tvControl = segue.destinationViewController as! TableViewController
            
            for (var indexNum = 0; indexNum < dataModel.posts.count; indexNum++) {
                if(dataModel.posts.objectAtIndex(indexNum).valueForKey("category")!.isEqualToString("공연")){
                    cagoDataArray.addObject(dataModel.posts.objectAtIndex(indexNum))
                }
            }
            tvControl.cagoAry = cagoDataArray as NSArray
            tvControl.currentState = segue.identifier!
        }else if(segue.identifier == "goExhibit"){
            var tvControl = segue.destinationViewController as! TableViewController
            
            for (var indexNum = 0; indexNum < dataModel.posts.count; indexNum++) {
                if(dataModel.posts.objectAtIndex(indexNum).valueForKey("category")!.isEqualToString("전시")){
                    cagoDataArray.addObject(dataModel.posts.objectAtIndex(indexNum))
                }
            }
            tvControl.cagoAry = cagoDataArray as NSArray
            tvControl.currentState = segue.identifier!
        }else if(segue.identifier == "goEtc"){
            var tvControl = segue.destinationViewController as! TableViewController
            
            for (var indexNum = 0; indexNum < dataModel.posts.count; indexNum++) {
                if(dataModel.posts.objectAtIndex(indexNum).valueForKey("category")!.isEqualToString("기타")){
                    cagoDataArray.addObject(dataModel.posts.objectAtIndex(indexNum))
                }
            }
            tvControl.cagoAry = cagoDataArray as NSArray
            tvControl.currentState = segue.identifier!
        }else if(segue.identifier == "goAll"){
            var tvControl = segue.destinationViewController as! TableViewController
            
            tvControl.cagoAry = dataModel.posts as NSArray
            tvControl.currentState = segue.identifier!
        }else if(segue.identifier == "goFavor"){

        }else if(segue.identifier == "goInfo"){
            
        }
    }
    @IBAction func actMenuBtn(sender: AnyObject) {
        let frameForHeight : CGFloat = view.frame.size.height/667
        let frameForWidth : CGFloat = view.frame.size.width/375
        
        if(transforming  == false){
            UIView.animateWithDuration(1.2, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: nil, animations: {
                self.menuBtn.transform = CGAffineTransformMakeTranslation(0,0)
                self.infoBg.alpha = CGFloat(0.0)
                }, completion: {finished in self.appearObj()})
            UIView.animateWithDuration(1.3, delay: 1.5, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: nil, animations: {
                self.favorBtn.transform = CGAffineTransformMakeTranslation(0,-120 * frameForHeight)
                self.marketBtn.transform = CGAffineTransformMakeTranslation(110 * frameForWidth,-55 * frameForHeight)
                self.eventBtn.transform = CGAffineTransformMakeTranslation(110 * frameForWidth,+55 * frameForHeight)
                self.exhibitBtn.transform = CGAffineTransformMakeTranslation(0,120 * frameForHeight)
                self.allBtn.transform = CGAffineTransformMakeTranslation(-110 * frameForWidth,55 * frameForHeight)
                self.infoBtn.transform = CGAffineTransformMakeTranslation(-110 * frameForWidth,-55 * frameForHeight)
            }, completion: nil)

            transforming = true
        }else{
            UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.5, options: nil, animations: {
                self.favorBtn.transform = CGAffineTransformMakeTranslation(0,0)
                self.marketBtn.transform = CGAffineTransformMakeTranslation(0,0)
                self.eventBtn.transform = CGAffineTransformMakeTranslation(0,0)
                self.exhibitBtn.transform = CGAffineTransformMakeTranslation(0,0)
                self.allBtn.transform = CGAffineTransformMakeTranslation(0,0)
                self.infoBtn.transform = CGAffineTransformMakeTranslation(0,0)
                }, completion: {finished in self.hiddenObj()})
            
            UIView.animateWithDuration(1.3, delay: 1.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: nil, animations: {
                self.menuBtn.transform = CGAffineTransformMakeTranslation(0,-self.moveHeight * frameForHeight)
                self.infoBg.alpha = CGFloat(1.0)
                }, completion: nil)
            transforming = false
        }
    }
    func hiddenObj(){
        self.favorBtn.hidden = true
        self.marketBtn.hidden = true
        self.eventBtn.hidden = true
        self.exhibitBtn.hidden = true
        self.allBtn.hidden = true
        self.infoBtn.hidden = true
    }
    func appearObj(){
        self.favorBtn.hidden = false
        self.marketBtn.hidden = false
        self.eventBtn.hidden = false
        self.exhibitBtn.hidden = false
        self.allBtn.hidden = false
        self.infoBtn.hidden = false
    }
    func rotateOnce() {
        UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveLinear, animations: {
                self.aniImageView.transform = CGAffineTransformRotate(self.aniImageView.transform, 3.1415926*0.25)
                self.aniImageView2.transform = CGAffineTransformRotate(self.aniImageView2.transform, 3.1415926*0.25)
                self.aniImageView3.transform = CGAffineTransformRotate(self.aniImageView3.transform, 3.1415926*0.25)
                self.aniImageView4.transform = CGAffineTransformRotate(self.aniImageView4.transform, 3.1415926*0.25)
            }, completion: {finished in self.rotateAgain()})
    }
    func rotateAgain() {
        UIView.animateWithDuration(1.0, delay: 0.0, options: .CurveLinear, animations: {
            self.aniImageView.transform = CGAffineTransformRotate(self.aniImageView.transform, -3.1415926*0.25)
            self.aniImageView2.transform = CGAffineTransformRotate(self.aniImageView2.transform, -3.1415926*0.25)
            self.aniImageView3.transform = CGAffineTransformRotate(self.aniImageView3.transform, -3.1415926*0.25)
            self.aniImageView4.transform = CGAffineTransformRotate(self.aniImageView4.transform, -3.1415926*0.25)
            },completion: {finished in
                if self.rotating
                {
                    self.rotateOnce()
                
                }
            })
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let indexPage = scrollView.contentOffset.y / scrollView.frame.height
        let indexHeight = indexPage*667+190
        if(indexHeight < 390){
            UIView.animateWithDuration(0.5, delay: 0.00, usingSpringWithDamping: 1.0, initialSpringVelocity: 0, options: nil, animations: {
                self.menuBtn.transform = CGAffineTransformMakeTranslation(0,-indexHeight)
                }, completion: nil)
        }else {
            
        }
        
    }
    
}

